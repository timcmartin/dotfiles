# Ported from ~/.dotfiles/tmuxinator/uniadmin.yml
# tmuxinator session: uniadmin → hmux workspace: uniadmin
# Each tmuxinator "window" becomes a herdr tab.
ROOT="$UNISPORKAL/misc_admin"

# --- Tab: uniadmin ---
tab_new     uniadmin
pane_new    nvim "nvim"
pane_split  right "" term "echo \"💡 Empty Terminal\""

# --- Tab: servers ---
tab_new     servers
pane_new    webserver "echo \"💡 Run 'giw' here (webpack dev server)\""
pane_split  right ""  rails "echo \"💡 Run 'gir' here (rails server)\""

# --- Tab: watchers ---
tab_new     watchers
pane_new    lint  "echo \"💡 Run 'watchlint' here (watch eslint)\""
pane_split  right "" jest  "echo \"💡 Run 'wyj' here (jest tests)\""
pane_split  right "" rspec "echo \"💡 Run 'giguard' here (rspec)\""

# --- Tab: logs ---
tab_new     logs
pane_new    devlog        "echo \"💡 Run 'devlog' here (dev logs)\""
pane_split  right ""      unisporkal-log "echo \"💡 Run 'unilog' here (unisporkal logs)\""
