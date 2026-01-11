# Dotfiles

Personal and work dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/) and [Strap](https://github.com/MikeMcQuaid/strap).

This config includes [Tmux Catppuccin](https://github.com/catppuccin/tmux) and is designed for seamless, context-aware setup across multiple macOS user accounts.
It is currently locked at my work machine version, (v0.1.0) but there have been significant changes that require edits to the tmux config.

---

## Setup Instructions

### 1. **Bootstrap with Strap**

- Open [Strap](https://strap.mikemcquaid.com/) in your browser and follow the instructions.
- Strap will:
  - Clone this dotfiles repo.
  - Use your [Brewfile](https://github.com/timcmartin/homebrew-brewfile) to install Homebrew packages and casks.
  - Run `script/setup.sh` to configure your dotfiles.

### 2. **Run the Setup Script**

From your dotfiles directory:

```sh
cd ~/Dotfiles
./script/setup.sh
```

- This script:
  - Backs up any existing dotfiles to `~/dotfiles-backup/`.
  - Symlinks all managed dotfiles using GNU Stow, respecting `.stow-local-ignore`.
  - Handles context-specific configuration (e.g., sets your git email based on your macOS user).
  - Symlinks directories (e.g., `scripts/` → `~/.scripts`) as single links where appropriate.
  - Ensures `~/.config/tmuxinator` and other config directories are created and symlinked as needed.

**You do not need to run `stow .` manually.**
All symlinking and context detection is handled by `script/setup.sh`.

---

## Brewfile

- Used by Strap: <https://github.com/timcmartin/homebrew-brewfile>
- Installs all required CLI tools and GUI apps via Homebrew and Mac App Store.
- Will clone Dotfiles repository to `/.dotfiles/` and Brewfile into `/.homebrew-brewfile`.

---

## Other Things to Install (Manual Checklist)

These are not handled by Brew or Strap, but are part of your preferred environment:

- **Node.js** (using Nodenv)
- **oh-my-zsh**:
  - Theme:
    - `git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1`
    - `ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"`
  - Plugins:
    - zsh-syntax-highlighting:
      - `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
    - zsh-autosuggestions:
      - `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
- **Copilot**: <https://docs.github.com/en/copilot/using-github-copilot/getting-started-with-github-copilot?tool=vimneovim>
- **AWS config**
- **TMUX Plugin Manager**: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
- **Catppuccin Tmux**: `https://github.com/catppuccin/tmux`
- **Chrome**
- **Sibelius** (Personal)
- **Keyboard mapping**: Caps Lock → Control
- **LazyVim**

---

## Notes

- The setup script is idempotent and safe to re-run.
- `.stow-local-ignore` ensures only intended files are symlinked.
- Context-specific configuration (e.g., git email) is handled automatically based on your macOS user account.
- For any manual steps, refer to the checklist above.

---

## TODO

- Update catppuccin and tmux setup.
- XCode back in Brewfile. 
- LazyVim setup

---
