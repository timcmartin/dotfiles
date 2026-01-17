#!/usr/bin/env bash
# git-repos - list git branch/status for immediate subdirectories (safe with spaces)
# Place this script in your dotfiles/scripts or ~/bin and make executable.
#
# Usage:
#   git-repos [path]        # default path is current directory; inspects immediate subdirs
#   git-repos --dirty       # show only repos with uncommitted changes
#   git-repos --ahead       # include upstream ahead/behind counts (may be slower)
#   git-repos --simple      # print "dir branch" (compact)
#   git-repos --help
#
# Notes:
# - Uses `git -C` so it never runs git in your current working directory by accident.
# - Handles directory names with spaces.
# - Only checks first-level subdirectories. To recurse, run `find` and call git-repos on each, or adapt script.

set -euo pipefail

print_usage() {
  cat <<EOF
git-repos - list git branch/status for immediate subdirectories

Usage:
  git-repos [path]           Inspect immediate subdirectories of [path] (default: .)
  git-repos --dirty          Show only repos with uncommitted changes
  git-repos --ahead          Include upstream ahead/behind counts (may be slower)
  git-repos --simple         Compact output: "dir branch"
  git-repos --help
EOF
}

# defaults
TARGET_DIR="."
ONLY_DIRTY=0
INCLUDE_AHEAD=0
SIMPLE=0

# parse args (simple)
while [[ $# -gt 0 ]]; do
  case "$1" in
  --help | -h)
    print_usage
    exit 0
    ;;
  --dirty)
    ONLY_DIRTY=1
    shift
    ;;
  --ahead)
    INCLUDE_AHEAD=1
    shift
    ;;
  --simple)
    SIMPLE=1
    shift
    ;;
  --*)
    echo "Unknown option: $1" >&2
    print_usage
    exit 2
    ;;
  *)
    TARGET_DIR="$1"
    shift
    ;;
  esac
done

# normalize target dir
TARGET_DIR="${TARGET_DIR:-.}"

# header unless simple
if [[ $SIMPLE -eq 0 ]]; then
  printf "%-30s %-20s %-8s %s\n" "DIR" "BRANCH" "STATUS" "AHEAD/BHND"
fi

# iterate immediate subdirectories safely
for d in "$TARGET_DIR"/*/; do
  # skip expansion if nothing matches
  [[ -e "$d" ]] || break
  # ensure it's a directory
  [[ -d "$d" ]] || continue

  # test for git repo
  if git -C "$d" rev-parse --git-dir >/dev/null 2>&1; then
    # branch — handle detached HEAD gracefully
    branch="$(git -C "$d" rev-parse --abbrev-ref HEAD 2>/dev/null || true)"
    if [[ -z "$branch" || "$branch" == "HEAD" ]]; then
      branch="$(git -C "$d" rev-parse --short HEAD 2>/dev/null || echo "DETACHED")"
    fi

    # dirty/clean
    if [[ -n "$(git -C "$d" status --porcelain 2>/dev/null)" ]]; then
      status="dirty"
    else
      status="clean"
    fi

    # ahead/behind
    aheadbhnd="-"
    if [[ $INCLUDE_AHEAD -eq 1 ]]; then
      # try to detect upstream; if none, leave '-'
      if upstream="$(git -C "$d" rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null || true)"; then
        if [[ -n "$upstream" ]]; then
          counts="$(git -C "$d" rev-list --left-right --count "$upstream"...HEAD 2>/dev/null || true)"
          if [[ -n "$counts" ]]; then
            left=$(awk '{print $1}' <<<"$counts")
            right=$(awk '{print $2}' <<<"$counts")
            aheadbhnd="${right}/${left}" # show as ahead/behind (HEAD/upstream)
          fi
        fi
      fi
    fi

    dir_name="${d%/}"
    dir_name="${dir_name##*/}"

    if [[ $ONLY_DIRTY -eq 1 && "$status" != "dirty" ]]; then
      continue
    fi

    if [[ $SIMPLE -eq 1 ]]; then
      printf "%s %s\n" "$dir_name" "$branch"
    else
      printf "%-30s %-20s %-8s %s\n" "$dir_name" "$branch" "$status" "$aheadbhnd"
    fi
  fi
done
