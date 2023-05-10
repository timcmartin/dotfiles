# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
# ZSH_THEME="honukai"
# ZSH_THEME="muse"
ZSH_THEME="spaceship"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
else
    print "404: ~/.bash_aliases not found."
fi

# Vim Editor
export EDITOR='vim'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=7

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# Recommended for Tmuxinator
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails ruby brew vagrant postgres redis-cli bundler golang git git-flow git-extras last-working-dir macos ssh-agent web-search zsh-syntax-highlighting zsh-autosuggestions tmux tmuxinator gitfast rbenv docker)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

zrcl="$HOME/.zshrc.local"
[[ ! -a $zrcl ]] || source $zrcl

export PATH=/usr/local/sbin:$PATH

fpath=(~/.zsh $fpath)

export PATH=$HOME/Library/Python/2.7/bin:$PATH

# pbcopy
# I needed this for Linux box - not for mac
#alias pbcopy='xclip -selection clipboard'
#alias pbpaste='xclip -selection clipboard -o'

# nodenv
eval "$(nodenv init -)"

# export NVM_DIR="$HOME/.nvm"
# . "/usr/local/opt/nvm/nvm.sh"
# #[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Getty Stuff
export GITLAB_ACCESS_TOKEN=AEebyymeZ27DS8FwB9eJ
_git_fi ()
{
    __gitcomp_nl "$(__git_refs)"
}

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -p ~/.ignore -g ""'

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
eval "$(rbenv init - zsh)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
