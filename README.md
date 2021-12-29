# Dotfiles

This repository borrows heavily from [jcarley/dotmatrix](https://github.com/jcarley/dotmatrix),
but was tweaked for use with [Dotbot](https://github.com/anishathalye/dotbot) and [Strap](https://github.com/timcmartin/strap).

This config makes use of powerline and tmux-powerline.

## Preferred Setup:

1. `git clone https://github.com/timcmartin/strap`
2. edit `bin/strap.sh` to have the correct Github credentials.
3. Run `bash bin/strap.sh`

Strap has been forked from the original repo and modified to work with Dotbot.

## Secondary Setup:

`git clone --recursive https://github.com/timcmartin/dotfiles.git ~/Dotfiles && cd ~/Dotfiles && ./install`

1. git clone this project

```
  git clone https://github.com/timcmartin/dotfiles.git ~/Dotfiles
```

2. Change into the ~/.dotfiles directory and run ./install

```
  cd ~/Dotfiles
  scripts/./install
```

Dotbot will update the submodules and create the requisite symlinks.

Will want to update `gitconfig` to use personal email instead of work email.
Lk
## Editing:

To edit the functionality, of Dotbot, edit the `install.conf.yaml` file.

See [Dotbot](https://github.com/anishathalye/dotbot) for more information and examples.

## Brewfile

* Used by Strap: https://github.com/timcmartin/homebrew-brewfile

## Vim

* Running `:PlugInstall` from Vim should do the trick.
* Maintaining my own colorscheme here: https://github.com/timcmartin/vim-afterglow

## Other Things to Install

* iTerm2
* Node.js => Using Nodenv
* oh-my-zsh:
  * theme:
    * `git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1`
    * `ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"`
  * zsh-syntax-highlighting:
    * `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
    * autocomplete
      * `sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
* Alfred
* Bartender
* iStat menus
* Dropbox
* Slack
* AnyConnect
* Keeping You Awake
* Muzzle
* Fork
* 1Password
* AWS config
* Chrome
* Reaper
* Sibelius
* Keyboard mapping: Caps Lock -> Control

### Tmux Plugin Manager:
`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
