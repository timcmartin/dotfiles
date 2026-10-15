# Ported from ~/.dotfiles/tmuxinator/sign-in.yml
ROOT="$UNISPORKAL/sign_in"
ENGINE="$UNISPORKAL/gems/unisporkal_engine"

# --- Tab: sign_in ---
tab_new sign_in
pane_new nvim "nvim"
pane_split right "" claude ""

# --- Tab: servers ---
tab_new servers
pane_new webpack "echo \"💡 Run 'giw' here (webpack dev server)\""
pane_split right "" rails "echo \"💡 Run 'gir' here (rails server)\""

# --- Tab: engine ---
tab_new engine
pane_new code "cd $ENGINE"
pane_split right "" claude "cd $ENGINE"
