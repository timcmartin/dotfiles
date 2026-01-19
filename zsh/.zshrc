# --- User/Host-specific configuration ---
case "$USER" in
  tim.martin)
    USER_HOME="/Users/tim.martin"
    PERSONAL_SRC="$USER_HOME/src/personal"
    DOTFILES_DIR="$USER_HOME/.dotfiles"
    ;;
  timcmartin)
    USER_HOME="/Users/timcmartin"
    PERSONAL_SRC="$USER_HOME/src"
    DOTFILES_DIR="$USER_HOME/.dotfiles"
    ;;
  *)
    USER_HOME="$HOME"
    PERSONAL_SRC="$USER_HOME/src"
    DOTFILES_DIR="$USER_HOME/.dotfiles"
    ;;
esac
GETTY_SRC="$USER_HOME/src/getty"
UNISPORKAL="$GETTY_SRC/unisporkal"

# --- Oh My Zsh ---
ZSH="$USER_HOME/.oh-my-zsh"
ZSH_THEME="spaceship"

# --- Dropbox ---
export DROPBOX_DIR="$USER_HOME/Library/CloudStorage/Dropbox"

# --- Editor ---
export EDITOR="nvim"

# --- Aliases ---
[[ -e ~/.bash_aliases ]] && emulate sh -c 'source ~/.bash_aliases'

# --- PATH Setup ---
# Start with system paths, then add language/toolchain bins, then user bins
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="$USER_HOME/.rbenv/bin:$PATH"
export PATH="$USER_HOME/.yarn/bin:$USER_HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/opt/homebrew/opt/mysql/bin:$PATH"
export PATH="$USER_HOME/scripts:$PATH"
export PATH="$USER_HOME/.local/bin:$PATH" # pipx/local binaries

# --- Zsh Plugins ---
plugins=(
  rails
  ruby
  brew
  vagrant
  postgres
  redis-cli
  bundler
  golang
  git
  git-flow
  git-extras
  last-working-dir
  macos
  ssh-agent
  web-search
  zsh-syntax-highlighting
  zsh-autosuggestions
  tmux
  tmuxinator
  rbenv
  docker
)
autoload -U compinit && compinit

# --- Oh My Zsh Core ---
source "$ZSH/oh-my-zsh.sh"
unsetopt correct_all

# --- Local Zshrc ---
ZRCL="$USER_HOME/.zshrc.local"
[[ -f "$ZRCL" ]] && source "$ZRCL"

# --- FZF Integration ---
[ -f "$USER_HOME/.fzf.zsh" ] && source "$USER_HOME/.fzf.zsh"
export FZF_DEFAULT_COMMAND='ag -p ~/.ignore -g ""'

# --- Completion for Vault (if installed) ---
if command -v vault >/dev/null 2>&1; then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C /usr/local/bin/vault vault
fi

# --- rbenv, pyenv, nodenv ---
eval "$(rbenv init - zsh)"
# Not needed?
# eval "$(pyenv init -)"
eval "$(nodenv init - zsh)"

# --- Disable software flow control (ctrl-s/ctrl-q) ---
stty -ixon

# --- Custom Functions ---
_git_fi () {
  __gitcomp_nl "$(__git_refs)"
}

# --- Getty Images Environment ---
# GITLAB_ACCESS_TOKEN GOES HERE

# --- Miscellaneous ---
DISABLE_AUTO_TITLE="true" # Recommended for Tmuxinator

# --- Source additional scripts if present ---
[ -f "$USER_HOME/authaws" ] && source "$USER_HOME/authaws"
