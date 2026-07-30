#!/usr/bin/env bash
# Update the formula and its Python resources to a published iParq version.
set -euo pipefail

formula="miguelelgallo/iparq/iparq"
version="${1:-}"

if [[ -z "$version" ]]; then
  version=$(curl -fsSL https://pypi.org/pypi/iparq/json | jq -r '.info.version')
fi

tap_root=$(brew --repo miguelelgallo/iparq)
repo_root=$(git rev-parse --show-toplevel)

if [[ "$repo_root" != "$tap_root" ]]; then
  echo "Run this script from the Homebrew tap checkout at $tap_root." >&2
  exit 1
fi

brew bump-formula-pr \
  --write-only \
  --version="$version" \
  --python-package-name=iparq \
  "$formula"
