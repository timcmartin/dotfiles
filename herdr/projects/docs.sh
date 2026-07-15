# Captured from an existing herdr `docs` workspace layout.
# No tmuxinator equivalent — this reflects your live setup: one tab, two
# panes (dotfiles + homebrew-brewfile). The workspace root is $HOME so each
# pane can cd into its own repo independently.
ROOT="$HOME"

# --- Tab: docs ---
tab_new     docs
pane_new    dotfiles  "cd $HOME/.dotfiles"
pane_split  right ""  homebrew  "cd $HOME/.homebrew-brewfile"
