ROOT="$UNISPORKAL/gems/sites"
PACKAGE="$UNISPORKAL/packages/sites"
LANDING="$UNISPORKAL/landing"
ENGINE="$UNISPORKAL/gems/unisporkal_engine"
ADP="$UNISPORKAL/asset_detail"
ADPMAIN="$ADP/master"
AARP="$UNISPORKAL/federated-components/asset-acquisition"
PURCHASE="$UNISPORKAL/purchase"
UNIDOCS="$UNISPORKAL/unidocs"

# --- Tab: sites-gem ---
tab_new sites-g
pane_new nvim "nvim"
pane_split right "" term ""

# --- Tab: sites-package ---
tab_new sites-p
pane_new nvim "cd $PACKAGE && nvim"
pane_split right "" term "cd $PACKAGE"

# --- Tab: landing ---
tab_new landing
pane_new nvim "cd $LANDING && nvim"
pane_split right "" term "cd $LANDING"

# --- Tab: engine ---
tab_new engine
pane_new nvim "cd $ENGINE && nvim"
pane_split right "" term "cd $ENGINE"

# --- Tab: adp ---
tab_new adp
pane_new nvim "cd $ADPMAIN && nvim"
pane_split right "" term "cd $ADPMAIN"

# --- Tab: aarp ---
tab_new aarp
pane_new nvim "cd $AARP && nvim"
pane_split right "" term "cd $AARP"

# --- Tab: purchase ---
tab_new purchase
pane_new nvim "cd $PURCHASE && nvim"
pane_split right "" term "cd $PURCHASE"

# --- Tab: unidocs ---
tab_new unidocs
pane_new nvim "cd $UNIDOCS && nvim"
pane_split right "" term "cd $UNIDOCS"
