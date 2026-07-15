# Example layout — copy/rename this file to a real project name.
#
# ROOT sets the working directory for every pane in the workspace.
ROOT="$HOME/src/getty/unisporkal/landing"

# First pane_new runs in the auto-created root pane.
pane_new  editor  "nvim"

# Right-split the editor pane, 40% width, run copilot.
pane_split right 0.4 copilot "copilot"

# Down-split the copilot pane, 30% height, run the dev server.
pane_split down  0.3 server  "bin/dev"
