# Ported from ~/.dotfiles/tmuxinator/landing.yml
ROOT="$UNISPORKAL/landing"

# --- Tab: landing ---
tab_new     landing
pane_new    nvim "nvim"
pane_split  right "" term ""

# --- Tab: servers ---
tab_new     servers
pane_new    rails  "echo \"💡 Run 'gir' here (rails server)\""
pane_split  right "" assets "echo \"💡 Run 'giw' here (webpack dev server)\""
