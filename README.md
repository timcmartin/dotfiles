# Dotfiles
* [Stow](https://www.youtube.com/watch?v=y6XCebnB9gs)
* [Strap](https://github.com/MikeMcQuaid/strap)

This config makes use of Tmux Catppuccin.

## Preferred Setup:

1. Open [Strap](https://strap.mikemcquaid.com/) in browser.
2. `cd ~/Dotfiles && stow .`

Will want to update `gitconfig` to use personal email instead of work email.

## Brewfile

* Used by Strap: https://github.com/timcmartin/homebrew-brewfile

## Vim

* Running `:PlugInstall` from Vim should do the trick.
* Maintaining my own colorscheme here: https://github.com/timcmartin/vim-afterglow

## Other Things to Install

* iTerm2 => Should be done with brewfile
* Node.js => Using Nodenv
* oh-my-zsh:
  * theme:
    * `git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1`
    * `ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"`
  * zsh-syntax-highlighting:
    * `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
    * autocomplete
      * `sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
* Copilot: https://docs.github.com/en/copilot/using-github-copilot/getting-started-with-github-copilot?tool=vimneovim
* Alfred
* Bartender
* iStat menus => Should be done with brewfile
* Dropbox => Should be done with brewfile
* Slack
* AnyConnect
* Keeping You Awake => Should be done with brewfile
* Muzzle
* Fork
* 1Password => Should be done with brewfile
* AWS config
* Chrome
* Reaper: Personal
* Sibelius: Personal
* Keyboard mapping: Caps Lock -> Control

### Tmux Plugin Manager:
`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
