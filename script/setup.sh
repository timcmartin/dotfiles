#!/usr/bin/env bash
set -euo pipefail

# --- Config ---
BACKUP_DIR="$HOME/dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PACKAGES=(bash git ignore ruby tmux todo wezterm zsh) # Add/remove as needed
DIRECTORIES=(scripts claude)                                 # Add/remove as needed
CONFIG_PACKAGES=(tmuxinator herdr)
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
  local source="${2:-}"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    # $target used to be a symlink into this repo but is now a plain file —
    # something (e.g. Claude Code rewriting ~/.claude/settings.json in place)
    # replaced the link with its own copy. Capture that drift into the repo
    # source before it gets backed up, so re-running setup.sh can't silently
    # discard live changes that were never committed.
    if [ -n "$source" ] && [ -f "$source" ] && [ -f "$target" ] && ! cmp -s "$source" "$target"; then
      echo "Note: $target has diverged from $source — copying live changes into the repo (review with 'git -C \"$DOTFILES_DIR\" diff' before committing)"
      cp "$target" "$source"
    fi
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
    backup_and_remove "$target" "$file"
  done
  # Exclusions live in each package's own .stow-local-ignore (see bash/, tmux/,
  # nvim-lua/). Stow reads that file automatically; note that supplying one
  # REPLACES stow's built-in defaults, so a package that needs an exclusion must
  # also restate any default it still wants (e.g. "^/README.*").
  stow --dir="$DOTFILES_DIR" "$pkg"
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
      backup_and_remove "$HOME/$inner_name/$(basename "$entry")" "$entry"
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
  mkdir -p "$dest"
  # Only back up files that stow is about to place, so unrelated runtime
  # content in the same directory (e.g. herdr's session.json / *.log) stays
  # intact.
  shopt -s nullglob dotglob
  for entry in "$DOTFILES_DIR/$config_pkg"/*; do
    backup_and_remove "$dest/$(basename "$entry")" "$entry"
  done
  shopt -u nullglob dotglob
  echo "Stowing $config_pkg into $dest"
  stow --dir="$DOTFILES_DIR" --target="$dest" --no-folding "$config_pkg"
done

# --- Copy Claude Settings ---
# (Now handled by the DIRECTORIES loop above — claude/.claude/* is symlinked
# into ~/.claude/, leaving any untracked content like ~/.claude/commands/ intact.
# Claude Code rewrites ~/.claude/settings.json in place, which replaces the
# symlink with a plain file; backup_and_remove's drift capture above copies
# that plain file's content back into the repo before relinking, so rerunning
# this script can't silently discard settings changes made outside git.)

echo "Dotfiles setup complete. Backups (if any) are in $BACKUP_DIR"
