ROOT="$UNISPORKAL/sales-agents"
CODE="$ROOT/sales-agents"
INFRA="$ROOT/sales-agents-infrastructure"

# --- Tab: code ---
tab_new code
pane_new nvim "cd $CODE && nvim"
pane_split right "" term "cd $CODE"

# --- Tab: infrastructure ---
tab_new infrastructure
pane_new nvim "cd $INFRA && nvim"
pane_split right "" term "cd $INFRA"
