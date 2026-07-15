#!/usr/bin/env bash
#
# yarn-pnpm.sh
#
# For every immediate subdirectory of the target directory, remove
# node_modules and yarn.lock, then run `pnpm install`.
#
# Usage:
#   yarn-pnpm.sh [path]
#
# If [path] is omitted, the current working directory is used.

set -euo pipefail

target="${1:-$PWD}"

if [ ! -d "$target" ]; then
  echo "Error: '$target' is not a directory" >&2
  exit 1
fi

target="$(cd "$target" && pwd)"

echo "Migrating yarn -> pnpm under: $target"

for dir in "$target"/*/; do
  [ -d "$dir" ] || continue
  name="$(basename "$dir")"
  echo ""
  echo "=== $name ==="
  (
    cd "$dir"
    if [ -d .git ] || git rev-parse --git-dir >/dev/null 2>&1; then
      # Pick master or main, whichever exists
      branch="master"
      if ! git show-ref --verify --quiet refs/heads/master; then
        if git show-ref --verify --quiet refs/heads/main; then
          branch="main"
        fi
      fi
      git checkout "$branch"
      git pull
    else
      echo "(not a git repo, skipping checkout/pull)"
    fi
    rm -rf node_modules yarn.lock
    pnpm install
  )
done

echo ""
echo "Done."
