# Ported from ~/.dotfiles/tmuxinator/adp.yml
# tmuxinator session: adp → hmux workspace: adp
# asset_detail is a worktree container: master/ plus one dir per feature branch.
ROOT="$UNISPORKAL/asset_detail"

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
pane_new rails "cd ${FEATURE:-$MAIN} && echo \"💡 Run 'gir' here (rails server)\""
pane_split right "" assets "cd ${FEATURE:-$MAIN} && echo \"💡 Run 'giw' here (webpack dev server)\""

# --- Tab: worktrees ---
tab_new worktrees
pane_new git "cd $MAIN && git worktree list"
