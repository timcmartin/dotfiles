#!/usr/bin/env bash
set -euo pipefail

# Source and destination
SRC="/Users/tim.martin/.config/nvim-configs"
DEST="/Users/tim.martin/Dotfiles-refactor/nvim-lua/.config/nvim/lua"

# Directories to copy
DIRS=("config" "plugins" "user")

# Create destination directory if it doesn't exist
mkdir -p "$DEST"

for dir in "${DIRS[@]}"; do
  src_dir="$SRC/$dir"
  dest_dir="$DEST/$dir"
  if [ -d "$src_dir" ]; then
    echo "Copying $src_dir to $dest_dir"
    # Remove existing target to avoid stale files
    rm -rf "$dest_dir"
    cp -a "$src_dir" "$dest_dir"
  else
    echo "Warning: $src_dir does not exist, skipping"
  fi
done

echo "Neovim config files copied to dotfiles repo in Stow-ready structure."
