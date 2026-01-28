#!/bin/bash

set -e

show_help() {
  cat <<EOF
Usage: $0 [--no-restore-sessions] [--no-lazyvim] [--help]

Backs up Neovim configuration and data directories, restoring sessions and optionally installing LazyVim.

Options:
  --no-restore-sessions   Do not restore Neovim sessions after backup.
  --no-lazyvim            Do not install LazyVim after backup.
  --help                  Show this help message and exit.
EOF
}

NO_RESTORE_SESSIONS=0
NO_LAZYVIM=0

# Parse flags
for arg in "$@"; do
  case "$arg" in
  --no-restore-sessions)
    NO_RESTORE_SESSIONS=1
    ;;
  --no-lazyvim)
    NO_LAZYVIM=1
    ;;
  --help)
    show_help
    exit 0
    ;;
  *)
    echo "Unknown option: $arg"
    show_help
    exit 1
    ;;
  esac
done

declare -A DIRS=(
  ["$HOME/.config/nvim"]="$HOME/.config/nvim-backups"
  ["$HOME/.local/share/nvim"]="$HOME/.local/share/nvim-backups"
  ["$HOME/.local/state/nvim"]="$HOME/.local/state/nvim-backups"
  ["$HOME/.cache/nvim"]="$HOME/.cache/nvim-backups"
)

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

echo "Starting Neovim backup..."

for SRC in "${!DIRS[@]}"; do
  DEST="${DIRS[$SRC]}"
  BASENAME=$(basename "$SRC")
  BACKUP_PATH="$DEST/${BASENAME}_$TIMESTAMP"

  if [ -d "$SRC" ]; then
    echo "Backing up $SRC to $BACKUP_PATH"
    mkdir -p "$DEST"
    mv "$SRC" "$BACKUP_PATH"
  else
    echo "No directory found at $SRC, skipping."
  fi
done

echo "Backup complete."

if [ "$NO_LAZYVIM" -eq 0 ]; then
  echo "Cloning LazyVim starter to ~/.config/nvim..."
  git clone https://github.com/LazyVim/starter "$HOME/.config/nvim"
  rm -rf "$HOME/.config/nvim/.git"
  echo "LazyVim installed."
else
  echo "Skipping LazyVim installation as requested."
fi

if [ "$NO_RESTORE_SESSIONS" -eq 0 ]; then
  SHARE_BACKUP="${DIRS[$HOME / .local / share / nvim]}/nvim_$TIMESTAMP"
  SRC_SESSIONS="$SHARE_BACKUP/sessions"
  DEST_SESSIONS="$HOME/.local/share/nvim/sessions"

  if [ -d "$SRC_SESSIONS" ]; then
    echo "Restoring Neovim sessions from backup..."
    mkdir -p "$HOME/.local/share/nvim"
    cp -a "$SRC_SESSIONS" "$DEST_SESSIONS"
    echo "Sessions restored to $DEST_SESSIONS"
  else
    echo "No sessions directory found in backup, skipping restore."
  fi
else
  echo "Skipping session restore as requested."
fi

echo "All tasks completed."
