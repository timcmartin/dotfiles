# LazyVim Setup

```
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

## Setup

- [Install LazyVim](https://www.lazyvim.org/installation)

To install your Neovim Lua configuration on a new machine:

```sh
cd ~/.dotfiles  # or wherever your dotfiles repo is
stow -t ~ nvim-lua --adopt
git reset --HARD
stow -t ~ nvim-lua
```

This will symlink all managed files into `~/.config/nvim/lua/` without touching your `init.lua` or other Neovim files.
**NOTE** The `--adopt reset and stow again` flow is required as LazyVim writes these files by default.

## Copying Sessions

To restore your Neovim sessions:

```sh
cp -arf ~/.local/share/nvim.bak/sessions ~/.local/share/nvim/sessions
```

## Notes

- Do **not** symlink or version-control Neovim’s data or cache directories.
- Only the files in `config/`, `plugins/`, and `user/` are managed by this package.

## locations

- Neovim Config: `$HOME/.config/`

- Cache: `$HOME/.cache`

- Tmuxinator: `$HOME/.config/tmuxinator`

- Neovim Sessions: `$HOME/.local/share/nvim/sessions`

## Lazy Extras

● ai.copilot
● ai.copilot-chat
● ai.sidekick
● ai.supermaven
● coding.blink
● coding.yanky
● editor.dial
● editor.inc-rename
● editor.mini-diff
● editor.snacks_explorer
● editor.snacks_picker
● formatting.prettier
● linting.eslint
● util.dot
● util.mini-hipatterns

Enabled Languages: (7) permissions.
● lang.angular
● lang.docker
● lang.git
● lang.markdown
● lang.ruby
● lang.typescript
● lang.yaml

### Old Config

lazyvim.json

```json
{
  "extras": [
    "lazyvim.plugins.extras.ai.copilot",
    "lazyvim.plugins.extras.coding.mini-surround",
    "lazyvim.plugins.extras.coding.yanky",
    "lazyvim.plugins.extras.editor.mini-diff",
    "lazyvim.plugins.extras.editor.mini-files",
    "lazyvim.plugins.extras.formatting.prettier",
    "lazyvim.plugins.extras.lang.angular",
    "lazyvim.plugins.extras.lang.git",
    "lazyvim.plugins.extras.lang.json",
    "lazyvim.plugins.extras.lang.markdown",
    "lazyvim.plugins.extras.lang.ruby",
    "lazyvim.plugins.extras.lang.terraform",
    "lazyvim.plugins.extras.lang.typescript",
    "lazyvim.plugins.extras.lang.yaml",
    "lazyvim.plugins.extras.linting.eslint",
    "lazyvim.plugins.extras.util.dot",
    "lazyvim.plugins.extras.util.mini-hipatterns"
  ],
  "install_version": 8,
  "news": {
    "NEWS.md": "11866"
  },
  "version": 8
}
```
