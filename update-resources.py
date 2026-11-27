# /// script
# requires-python = ">=3.14,<3.15"
# dependencies = ["packaging==26.4"]
# ///
"""Refresh the Homebrew formula from a verified release and its bundled uv lock."""

import argparse
import hashlib
import io
import json
import os
import re
import subprocess
import tarfile
import tempfile
import tomllib
from pathlib import Path
from urllib.request import urlopen

from packaging.markers import Marker, default_environment

FORMULA = Path(__file__).parent / "Formula" / "iparq.rb"
TARGETS = (
    ("darwin", "arm64"),
    ("darwin", "x86_64"),
    ("linux", "aarch64"),
    ("linux", "x86_64"),
)


def release_lock(version):
    """Fetch the exact PyPI archive and verify its digest before reading the lock."""
    endpoint = (
        f"https://pypi.org/pypi/iparq/{version}/json"
        if version
        else "https://pypi.org/pypi/iparq/json"
    )
    with urlopen(endpoint) as response:
        release = json.load(response)
    version = release["info"]["version"]
    (source,) = (item for item in release["urls"] if item["packagetype"] == "sdist")
    with urlopen(source["url"]) as response:
        data = response.read()
    if hashlib.sha256(data).hexdigest() != source["digests"]["sha256"]:
        raise ValueError("Published iParq archive failed SHA-256 verification")
    with (
        tempfile.TemporaryDirectory() as tmp,
        tarfile.open(fileobj=io.BytesIO(data), mode="r:gz") as archive,
    ):
        root = Path(tmp)
        for filename in ("pyproject.toml", "uv.lock"):
            with archive.extractfile(f"iparq-{version}/{filename}") as stream:
                (root / filename).write_bytes(stream.read())
        subprocess.run(
            [
                "uv",
                "export",
                "--frozen",
                "--no-dev",
                "--extra",
                "vortex",
                "--no-emit-project",
                "--format",
                "pylock.toml",
                "--output-file",
                "pylock.toml",
            ],
            cwd=root,
            stdout=subprocess.DEVNULL,
            check=True,
        )
        with (root / "pylock.toml").open("rb") as file:
            packages = tomllib.load(file)["packages"]
    return source, packages


def runtime_pins(packages, platform, machine):
    """Evaluate the exported runtime requirements for a Homebrew operating system and CPU."""
    env = default_environment()
    env.update(
        sys_platform=platform,
        platform_system="Darwin" if platform == "darwin" else "Linux",
        platform_machine=machine,
    )
    return {
        p["name"]: p
        for p in packages
        if "marker" not in p or Marker(p["marker"]).evaluate(env)
    }


def replace_once(text, pattern, replacement):
    """Replace exactly one formula section before changing the file on disk."""
    updated, count = re.subn(pattern, lambda _: replacement, text, flags=re.MULTILINE)
    if count != 1:
        raise ValueError(f"Expected one matching formula section, found {count}")
    return updated


def render(text, source, packages):
    """Render pinned source resources and all four platform-specific native wheels."""
    runtime = runtime_pins(packages, *TARGETS[0])
    if any(runtime_pins(packages, *target) != runtime for target in TARGETS[1:]):
        raise ValueError(
            "Platform-specific source dependencies require separate formula stanzas"
        )
    vortex = runtime.pop("vortex-data")
    wheels = {w["url"].rsplit("-", 1)[-1]: w for w in vortex["wheels"]}

    def wheel_resource(match):
        wheel = wheels.pop(match["url"].rsplit("-", 1)[-1])
        return f'url "{wheel["url"]}", using: :nounzip\n        sha256 "{wheel["hashes"]["sha256"]}"'

    pattern = r'url "(?P<url>[^"]+/vortex_data-[^"]+\.whl)", using: :nounzip\n\s+sha256 "[0-9a-f]{64}"'
    text, count = re.subn(pattern, wheel_resource, text)
    if count != len(TARGETS):
        raise ValueError(f"Expected four Vortex wheel resources, found {count}")
    text = replace_once(
        text,
        r'^  url "[^"]+"\n  sha256 "[0-9a-f]{64}"',
        f'  url "{source["url"]}"\n  sha256 "{source["digests"]["sha256"]}"',
    )
    blocks = []
    for name, package in sorted(runtime.items()):
        sdist = package["sdist"]
        blocks.append(
            f'  resource "{name}" do\n    url "{sdist["url"]}"\n'
            f'    sha256 "{sdist["hashes"]["sha256"]}"\n  end\n\n'
        )
    sources = r'(?:^  resource "[^"]+" do\n    url "[^"]+"\n    sha256 "[0-9a-f]{64}"\n  end\n\n)+'
    return replace_once(text, sources, "".join(blocks))


def main():
    """Atomically write the complete formula after verifying every required resource."""
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("version", nargs="?")
    source, packages = release_lock(parser.parse_args().version)
    updated = render(FORMULA.read_text(), source, packages)
    with tempfile.NamedTemporaryFile(
        mode="w", dir=FORMULA.parent, delete=False
    ) as file:
        file.write(updated)
    path = Path(file.name)
    try:
        path.chmod(FORMULA.stat().st_mode)
        os.replace(path, FORMULA)
    finally:
        path.unlink(missing_ok=True)


if __name__ == "__main__":
    main()
