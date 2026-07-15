# Ported from ~/.dotfiles/tmuxinator/proxy.yml
# tmuxinator session: gi_proxy → hmux workspace: gi_proxy
ROOT="$UNISPORKAL/gi_proxy"

# --- Tab: proxy ---
# (implicit — the workspace's initial tab)
pane_new    proxy "echo \"💡 Run 'giproxy' or 'gipa' here\""
pane_split  right "" term "echo \"💡 Just a terminal\""
