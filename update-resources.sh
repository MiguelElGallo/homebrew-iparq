#!/usr/bin/env bash
# update-resources.sh: Fetch latest PyPI sdist URLs and SHA256 for all Python resources
set -euo pipefail

FORMULA="Formula/iparq.rb"
# List resource names exactly as in formula
RESOURCES=(
  pyarrow annotated-types click colorama exceptiongroup iniconfig
  markdown-it-py mdurl packaging pluggy pydantic pydantic-core
  pygments pytest rich shellingham tomli typer typing-extensions
)

# Ensure jq is available
if ! command -v jq >/dev/null; then
  echo "Error: jq is required but not installed. Install with 'brew install jq'." >&2
  exit 1
fi

echo "Updating resources in $FORMULA..."

for name in "${RESOURCES[@]}"; do
  pkg=${name//-/_}
  echo "→ $name"
  meta=$(curl -sSf "https://pypi.org/pypi/$pkg/json")
  version=$(jq -r .info.version <<<"$meta")
  url=$(jq -r '.urls[] | select(.packagetype=="sdist") | .url' <<<"$meta" | head -1)
  sha256=$(curl -sL "$url" | shasum -a 256 | awk '{print $1}')

  # In-place update resource block: url then sha256
  sed -i.bak -E "/resource \"$name\" do/,/end/ s|url \".*\"|url \"$url\"|" "$FORMULA"
  sed -i.bak -E "/resource \"$name\" do/,/end/ s|sha256 \".*\"|sha256 \"$sha256\"|" "$FORMULA"
done

echo "Done. Backup saved as $FORMULA.bak"
