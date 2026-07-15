# Ported from ~/.dotfiles/tmuxinator/cns.yml
ROOT="$UNISPORKAL/federated-components/customer-notifications"

# --- Tab: checkout ---
tab_new cns
pane_new nvim "nvim"
pane_split right "" term ""

# --- Tab: checkout-server ---
tab_new cns-server
pane_new dynamodb "echo \"💡 Run 'colima start' here, then 'gidynamodb-admin'\""
pane_split right "" pnpm "echo \"💡 Run 'pnpm dev' here\""
pane_split right "" pnpm "echo \"💡 Run 'pnpm ruby' here\""
