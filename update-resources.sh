#!/usr/bin/env bash
# Refresh the Homebrew formula from the published iParq source distribution.
set -euo pipefail
exec uv run --script "$(dirname "$0")/update-resources.py" "$@"
