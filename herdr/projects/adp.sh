# Ported from ~/.dotfiles/tmuxinator/adp.yml
ROOT="$UNISPORKAL/adp"

# --- Tab: adp ---
tab_new adp
pane_new nvim "nvim"
pane_split right "" term ""

# --- Tab: servers ---
tab_new servers
pane_new rails "echo \"💡 Run 'gir' here (rails server)\""
pane_split right "" assets "echo \"💡 Run 'giw' here (webpack dev server)\""
