#!/usr/bin/env bash
set -euo pipefail

# --- Config ---
BACKUP_DIR="$HOME/dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
STOW_IGNORE_FILE="$DOTFILES_DIR/.stow-local-ignore"
PACKAGES=(bash git ignore ruby tmux todo wezterm zsh) # Add/remove as needed
DIRECTORIES=(scripts claude)                                 # Add/remove as needed
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
# Stow packages whose contents are directories (not dotfiles). The target is
# derived from each package's top-level directory name(s), so a package
# containing `scripts/` lands at `~/scripts/` and one containing `.foo/` would
# land at `~/.foo/` — no naming convention needs to be hard-coded here.
#
# We only back up/remove the individual entries stow is about to place. The
# parent directory is left intact so any user content living alongside the
# stowed files (e.g. `~/.claude/commands/`) is preserved.
for dir in "${DIRECTORIES[@]}"; do
  pkg_path="$DOTFILES_DIR/$dir"
  shopt -s nullglob dotglob
  for inner in "$pkg_path"/*/; do
    inner_name="$(basename "$inner")"
    mkdir -p "$HOME/$inner_name"
    for entry in "$inner"*; do
      backup_and_remove "$HOME/$inner_name/$(basename "$entry")"
    done
  done
  shopt -u nullglob dotglob
  stow --dir="$DOTFILES_DIR" --target="$HOME" --no-folding "$dir"
done

# --- Stow .config Subdirectories ---
# Symlink each file individually into ~/.config/<pkg>/ so edits to the live
# files flow back to the repo. --no-folding prevents stow from collapsing the
# whole package into a single directory symlink.
for config_pkg in "${CONFIG_PACKAGES[@]}"; do
  dest="$HOME/.config/$config_pkg"
  backup_and_remove "$dest"
  mkdir -p "$dest"
  echo "Stowing $config_pkg into $dest"
  stow --dir="$DOTFILES_DIR" --target="$dest" --no-folding "$config_pkg"
done

# --- Copy Claude Settings ---
# (Now handled by the DIRECTORIES loop above — claude/.claude/* is symlinked
# into ~/.claude/, leaving any untracked content like ~/.claude/commands/ intact.)

echo "Dotfiles setup complete. Backups (if any) are in $BACKUP_DIR"
