# Ported from ~/.dotfiles/tmuxinator/pnp.yml
# tmuxinator file:  pnp.yml
# tmuxinator name:  plans-and-pricing
# hmux workspace:   plans-and-pricing
ROOT="$UNISPORKAL/federated-components/plans-and-pricing"

# --- Tab: pnp ---
tab_new     pnp
pane_new    nvim "nvim"
pane_split  right "" term ""

# --- Tab: pnp-server ---
tab_new     pnp-server
pane_new    term ""
pane_split  right "" pnpm "echo \"💡 Run 'pnpm dev' here\""
