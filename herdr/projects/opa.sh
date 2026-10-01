AARP="$UNISPORKAL/federated-components/asset-acquisition"
CHECKOUT="$UNISPORKAL/federated-components/checkout"
PURCHASE="$UNISPORKAL/purchase"

# --- Tab: aarp ---
tab_new aarp
pane_new nvim "cd $AARP && lazygit"
pane_split right "" term "cd $AARP"

# --- Tab: checkout ---
tab_new checkout
pane_new nvim "cd $CHECKOUT && lazygit"
pane_split right "" term "cd $CHECKOUT"

# --- Tab: purchase ---
tab_new purchase
pane_new nvim "cd $PURCHASE && lazygit"
pane_split right "" term "cd $PURCHASE"
