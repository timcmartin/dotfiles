# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Hard Rules
- I use **Neovim (LazyVim)** exclusively. Never suggest VS Code or any VS Code-specific configuration.
- Always read relevant config files in this repo before answering questions about my setup. For nvim questions, check `nvim-lua/.config/nvim/lua/plugins/` first.

## Overview

Personal macOS dotfiles managed with **GNU Stow** for symlinking and **Strap** for bootstrapping. Supports two macOS user accounts with automatic context detection: `tim.martin` (work/Getty Images) and `timcmartin` (personal).

## Setup & Installation

```bash
# Full setup (idempotent, backs up existing files first)
./script/setup.sh

# Manual stow for a specific package (e.g., after adding new nvim config)
stow -t ~ nvim-lua

# Adopt existing files before symlinking (avoids conflicts)
stow -t ~ nvim-lua --adopt && git reset --hard && stow -t ~ nvim-lua
```

The setup script automatically detects the macOS username and sets the appropriate git email, stows config packages, copies tmuxinator templates, and symlinks `scripts/` as a directory.

## Architecture

### Stow Package Layout

Each top-level directory is a Stow package. Files within are symlinked to `~` (or a specified target) preserving their path relative to the package root:
- `zsh/.zshrc` → `~/.zshrc`
- `nvim-lua/.config/nvim/...` → `~/.config/nvim/...`
- `git/.gitconfig` → `~/.gitconfig`

Packages stowed to `~`: `bash`, `git`, `ignore`, `ruby`, `tmux`, `todo`, `zsh`

Special cases (see `script/setup.sh`):
- `scripts/` → `~/.scripts/` (symlinked as a directory, not individual files)
- `tmuxinator/` → `~/.config/tmuxinator/` (stowed with `--no-folding` so each `*.yml` is an individual symlink, letting edits flow back to the repo)
- `nvim-lua/` → stowed with `-t ~` separately
- `claude/` → `~/.claude/`, individual files via `--no-folding` (see [Claude Code Settings](#claude-code-settings) — this one needs special handling on rerun)

### `.stow-local-ignore`

Controls what Stow skips. Stow reads this file **from inside a package** (`bash/.stow-local-ignore`, `tmux/.stow-local-ignore`, `nvim-lua/.stow-local-ignore`) — a copy at the repo root is never read. Paths in it are relative to the package root, not the repo root.

Supplying the file **replaces** Stow's built-in default ignore list, so a package that adds one must restate any default it still wants — most often `^/README.*`, otherwise the package's own README gets symlinked into `$HOME`.

Directories that are simply absent from `PACKAGES`/`DIRECTORIES`/`CONFIG_PACKAGES` in `script/setup.sh` (`script/`, `boilerplate/`, `itermProfiles/`, `raycast/`, `dev/`) need no ignore rule — they are never stowed.

### Context-Aware Configuration

- **Git identity**: Set by `script/setup.sh` based on `$USER`
- **Shell aliases**: `bash/.bash_aliases` is primary; `.bash_aliases.work` and `.bash_aliases.personal` are context-specific variants (not symlinked by default)
- **Machine-local config**: `~/.zshrc.local` (not version-controlled) for machine-specific overrides
- **Secrets**: `~/.zsh_secrets` for API tokens (excluded from git, sourced by `.zshrc`)

### Neovim (LazyVim)

Config lives in `nvim-lua/.config/nvim/lua/` with:
- `config/` — LazyVim core overrides (keymaps, options, autocmds)
- `plugins/` — Custom plugin specs (Copilot, Sidekick, etc.)

Backup script: `~/.scripts/backup_nvim.sh [--no-restore-sessions] [--no-lazyvim]`

### Git Hooks

Template dir at `git/.git_template/hooks/` (configured via `git config init.templateDir`):
- `pre-commit`: Blocks `binding.pry` and unintended Gemfile changes
- `post-commit`, `post-checkout`, `post-merge`, `post-rewrite`: Auto-regenerate ctags

### Tmuxinator Sessions

30+ session templates in `tmuxinator/`. These are **symlinked** (via stow `--no-folding`) into `~/.config/tmuxinator/` during setup, so editing either side stays in sync with the repo. Use `mux <session>` to launch.

### Claude Code Settings

`claude/.claude/settings.json` is symlinked to `~/.claude/settings.json`, but Claude Code rewrites that file in place (permissions, model, statusline, enabled plugins, MCP servers) by writing a fresh file rather than editing through the symlink — this **replaces the symlink with a plain file**, silently disconnecting live changes from the repo.

`backup_and_remove()` in `script/setup.sh` handles this: before backing up and relinking, if the target has become a plain file that differs from its repo source, it copies the live content into the repo first (printing a note to review `git diff` before committing). So rerunning `setup.sh` can no longer silently discard settings changes made outside git — it captures them as an uncommitted diff instead. Always check `git status`/`git diff` after a `setup.sh` run and commit (or discard) what it captured.

## Key Paths

| Alias/Path | Location |
|---|---|
| `~/.scripts/` | User scripts (symlinked from `scripts/`) |
| `~/.config/tmuxinator/` | Tmux session templates (copied) |
| `~/.local/share/nvim/sessions/` | Neovim sessions |
| `~/dotfiles-backup/` | Timestamped backups from setup runs |
| `~/.zsh_secrets` | API tokens (not in repo) |
| `~/.zshrc.local` | Machine-local shell config (not in repo) |
