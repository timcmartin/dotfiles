# Ported from ~/.dotfiles/tmuxinator/account.yml
ROOT="$UNISPORKAL/account"

# --- Tab: account ---
tab_new account
pane_new nvim "nvim"
pane_split right "" term ""

# --- Tab: servers ---
tab_new servers
pane_new rails "echo \"💡 Run 'gir' here (rails server)\""
pane_split right "" assets "echo \"💡 Run 'giw' here (webpack dev server)\""
