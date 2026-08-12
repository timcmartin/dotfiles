# Ported from ~/.dotfiles/tmuxinator/uniadmin.yml
# tmuxinator session: uniadmin → hmux workspace: uniadmin
# Each tmuxinator "window" becomes a herdr tab.
# misc_admin is a worktree container: master/ plus one dir per feature branch.
ROOT="$UNISPORKAL/misc_admin"

MAIN="$ROOT/master"

# Most recently touched non-master worktree, if there is one.
FEATURE=""
for _wt in "$ROOT"/*/; do
  _wt="${_wt%/}"
  [ "$_wt" = "$MAIN" ] && continue
  [ -e "$_wt/.git" ] || continue
  if [ -z "$FEATURE" ] || [ "$_wt" -nt "$FEATURE" ]; then
    FEATURE="$_wt"
  fi
done

WORK="${FEATURE:-$MAIN}"

if [ -n "$FEATURE" ]; then
  FEATURE_NVIM="cd $FEATURE && nvim"
  FEATURE_TERM="cd $FEATURE"
else
  FEATURE_NVIM="echo \"💡 No feature worktree yet — git worktree add ../<branch> <branch>\""
  FEATURE_TERM="cd $MAIN"
fi

# --- Tab: master ---
tab_new master
pane_new nvim "cd $MAIN && nvim"
pane_split right "" term "cd $MAIN"

# --- Tab: feature ---
tab_new feature
pane_new nvim "$FEATURE_NVIM"
pane_split right "" term "$FEATURE_TERM"

# --- Tab: servers ---
tab_new servers
pane_new webserver "cd $WORK && echo \"💡 Run 'giw' here (webpack dev server)\""
pane_split right "" rails "cd $WORK && echo \"💡 Run 'gir' here (rails server)\""

# --- Tab: watchers ---
tab_new watchers
pane_new lint "cd $WORK && echo \"💡 Run 'watchlint' here (watch eslint)\""
pane_split right "" jest "cd $WORK && echo \"💡 Run 'wyj' here (jest tests)\""
pane_split right "" rspec "cd $WORK && echo \"💡 Run 'giguard' here (rspec)\""

# --- Tab: logs ---
tab_new logs
pane_new devlog "cd $WORK && echo \"💡 Run 'devlog' here (dev logs)\""
pane_split right "" unisporkal-log "cd $WORK && echo \"💡 Run 'unilog' here (unisporkal logs)\""

# --- Tab: worktrees ---
tab_new worktrees
pane_new git "cd $MAIN && git worktree list"
