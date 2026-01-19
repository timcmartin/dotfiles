# Dotfiles

Personal and work dotfiles managed with [GNU Stow][stow] and [Strap][strap].

This config includes [Tmux Catppuccin][catppuccin] and is designed for seamless,
context-aware setup across multiple macOS user accounts.

Currently locked at work machine version (v0.1.0). Significant changes require
edits to the tmux config.

---

## Setup Instructions

### 1. Bootstrap with Strap

- Open [Strap][strap] in your browser and follow the instructions.
- Strap will:
  - Clone this dotfiles repo.
  - Use your [Brewfile][brewfile] to install Homebrew packages and casks.
  - Run `script/setup.sh` to configure your dotfiles.

### 2. Run the Setup Script

From your dotfiles directory:

```sh
cd ~/Dotfiles
./script/setup.sh
```

- This script:
  - Backs up existing dotfiles to `~/dotfiles-backup/`.
  - Symlinks all managed dotfiles using GNU Stow, respecting `.stow-local-ignore`.
  - Handles context-specific config (e.g., sets git email by macOS user).
  - Symlinks directories (e.g., `scripts/` → `~/.scripts`) as single links.
  - Ensures `~/.config/tmuxinator` and other config dirs are created and
    symlinked as needed.

**You do not need to run `stow .` manually.**
All symlinking and context detection is handled by `script/setup.sh`.

When finished, change the remotes of `/.homebrew-brewfile` and `/.dotfiles` to
use SSH.

---

## Brewfile

- Used by Strap: <https://github.com/timcmartin/homebrew-brewfile>
- Installs all required CLI tools and GUI apps via Homebrew and Mac App Store.
- Clones Dotfiles repo to `/.dotfiles/` and Brewfile into `/.homebrew-brewfile`.

---

## Manual Checklist

These are not handled by Brew or Strap, but are part of your environment:

- **Node.js** (using Nodenv)
- **oh-my-zsh**:
  - Theme: - `git clone https://github.com/spaceship-prompt/spaceship-prompt.git \
"$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1` - `ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" \
"$ZSH_CUSTOM/themes/spaceship.zsh-theme"`
  - Plugins: - zsh-syntax-highlighting: - `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting` - zsh-autosuggestions: - `git clone https://github.com/zsh-users/zsh-autosuggestions \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
- **Copilot**: <https://docs.github.com/en/copilot/using-github-copilot/getting-started-with-github-copilot?tool=vimneovim>
- **AWS config**
- **TMUX Plugin Manager**: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
- **Catppuccin Tmux**: <https://github.com/catppuccin/tmux>
- **Chrome**
- **Sibelius** (Personal)
- **Keyboard mapping**: Caps Lock → Control
- **LazyVim**
- Recipes

---

> **Neovim Lua Config**
>
> The `nvim-lua` package manages only `~/.config/nvim/lua/` (not `init.lua` or
> other Neovim files).
> To install, run:
> `stow -t ~ nvim-lua`

---

## Notes

- The setup script is idempotent and safe to re-run.
- `.stow-local-ignore` ensures only intended files are symlinked.
- Context-specific config (e.g., git email) is handled automatically by macOS
  user account.
- For manual steps, refer to the checklist above.

---

## TODO

- Update catppuccin and tmux setup.
- XCode back in Brewfile.
- LazyVim setup.
- Sibelius setup.

---

## Important Locations

- $HOME/.cache => alias `app-cache`
- $HOME/.local/state => alias `app-state`
- $HOME/.local/share/nvim/sessions => alias `nvim-sessions`
- $HOME/.local/share/tmux/resurrect => alias `tmux-sessions`

---

[stow]: https://www.gnu.org/software/stow/
[strap]: https://github.com/MikeMcQuaid/strap
[catppuccin]: https://github.com/catppuccin/tmux
[brewfile]: https://github.com/timcmartin/homebrew-brewfile
