# Ported from ~/.dotfiles/tmuxinator/checkout.yml
ROOT="$UNISPORKAL/federated-components/checkout"

# --- Tab: checkout ---
tab_new     checkout
pane_new    nvim "nvim"
pane_split  right "" term ""

# --- Tab: checkout-server ---
tab_new     checkout-server
pane_new    copilot ""
pane_split  right "" pnpm "echo \"💡 Run 'pnpm dev' here\""
