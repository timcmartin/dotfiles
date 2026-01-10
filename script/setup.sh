#!/usr/bin/env bash
set -euo pipefail

# --- Config ---
BACKUP_DIR="$HOME/dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
STOW_IGNORE_FILE="$DOTFILES_DIR/.stow-local-ignore"
PACKAGES=(bash git ignore ruby tmux todo zsh) # Add/remove as needed
DIRECTORIES=(scripts)                         # Add/remove as needed
CONFIG_PACKAGES=(tmuxinator)
SHELL_NAME="$(basename "$SHELL")" # Only stow bash if using bash
if [[ "$SHELL_NAME" == "bash" ]]; then
  PACKAGES+=(bash)
fi

# --- Ensure GNU Stow ---
if ! command -v stow >/dev/null 2>&1; then
  echo "GNU Stow not found. Installing via Homebrew..."
  if command -v brew >/dev/null 2>&1; then
    brew install stow
  else
    echo "Homebrew not found. Please install Stow manually."
    exit 1
  fi
fi

# --- Backup & Remove Existing Files ---
mkdir -p "$BACKUP_DIR"

backup_and_remove() {
  local target="$1"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "Backing up $target to $BACKUP_DIR"
    mv "$target" "$BACKUP_DIR/"
  elif [ -L "$target" ]; then
    echo "Removing existing symlink $target"
    rm "$target"
  fi
}

# --- Git Identity ---
case "$USER" in
tim.martin)
  EMAIL="tim.martin@gettyimages.com"
  ;;
timcmartin)
  EMAIL="timcmartin@gmail.com"
  ;;
*)
  EMAIL=""
  ;;
esac

if [ -n "$EMAIL" ]; then
  echo "Setting up git identity for $USER: $EMAIL"
  cat >"$HOME/.gitconfig_identity" <<EOF
[user]
  email = $EMAIL
EOF
fi

# --- Stow Regular Dotfiles ---
for pkg in "${PACKAGES[@]}"; do
  # Backup existing dotfiles
  for file in "$DOTFILES_DIR/$pkg"/.*; do
    [[ -e "$file" ]] || continue
    base="$(basename "$file")"
    [[ "$base" == "." || "$base" == ".." ]] && continue
    target="$HOME/$base"
    backup_and_remove "$target"
  done
  stow --dir="$DOTFILES_DIR" --ignore="$(basename "$STOW_IGNORE_FILE")" "$pkg"
done

# --- Stow Directories ---
for dir in "${DIRECTORIES[@]}"; do
  target="$HOME/.$dir"
  backup_and_remove "$target"
  stow --dir="$DOTFILES_DIR" --target="$HOME" --no-folding "$dir"
done

# --- Stow .config Subdirectories ---
for config_pkg in "${CONFIG_PACKAGES[@]}"; do
  src="$DOTFILES_DIR/$config_pkg"
  dest="$HOME/.config/$config_pkg"
  backup_and_remove "$dest"
  echo "Copying $src to $dest"
  cp -a "$src" "$dest"
done

echo "Dotfiles setup complete. Backups (if any) are in $BACKUP_DIR"
