# Herdr

Personal Herdr configuration — a terminal workspace manager for AI coding
agents, running alongside my legacy tmux setup during migration.

## Files in this package

| Path | Purpose |
|---|---|
| `config.toml` | Herdr config. Stowed to `~/.config/herdr/config.toml`. |
| `projects/` | My actual per-project `hmux` layouts. Stowed to `~/.config/herdr/projects/`. |

The `hmux` launcher itself and the layout DSL reference now live in the
standalone [`hmuxinator`](https://gitlab.getty.cloud/tmartin/hmuxinator)
repo, installed via its `install.sh` (symlinks `hmux` onto `$PATH`, seeds
generic sample layouts). This package only holds my real, Getty-specific
project layouts on top of that.

`HMUX_DEFAULT_ROOT` is set to `$UNISPORKAL` in `zsh/.zshrc`, so `hmux
<project>` falls back to `$UNISPORKAL/<project>` for any project without a
layout file here.

## Daily flow

```sh
# Once per wezterm window — the long-lived Herdr session:
herdr

# Inside that session, spin up projects on demand:
hmux <project>
```

`hmux <project>` behaviour:
- If a workspace labeled `<project>` already exists, focus it.
- Otherwise, read `~/.config/herdr/projects/<project>.sh` (if present) and
  create a fresh workspace with the layout it describes.
- If no layout file exists, fall back to `$UNISPORKAL/<project>` when that
  directory exists, otherwise `$HOME`.

Ported layouts (matches my six active tmuxinator sessions):

- `hmux gi_proxy`
- `hmux uniadmin`
- `hmux landing`
- `hmux plans-and-pricing`
- `hmux checkout`
- `hmux docs`

## Adding a new project

Two options:

1. **Fast path** — just run `hmux <name>` and let it auto-open the repo dir
   as a single-pane workspace.
2. **Full layout** — add `projects/<name>.sh` here, then re-run
   `./script/setup.sh` (idempotent) or stow directly:

   ```sh
   stow --dir=~/.dotfiles --target=~/.config/herdr --no-folding herdr
   ```

   See hmuxinator's
   [`projects/README.md`](https://gitlab.getty.cloud/tmartin/hmuxinator/-/blob/main/projects/README.md)
   for the layout DSL, or copy one of its sample layouts (in
   `~/.config/herdr/projects/` after installing it) as a starting point.

## Keyboard reference

Prefix is `ctrl+a` (my tmux prefix, matched in `config.toml`). Read
`prefix+?` inside Herdr to see the full live keymap; the table below is the
subset I actually use.

### Workspaces (== projects in Model B)

| Key | Action |
|---|---|
| `prefix+w` | Workspace picker (fuzzy switcher across everything) |
| `prefix+shift+n` | New empty workspace |
| `prefix+shift+w` | Rename current workspace |
| `prefix+shift+d` | Close current workspace |
| `prefix+g` | Goto (jump-to-anything picker) |

### Tabs (inside a workspace)

| Key | Action |
|---|---|
| `prefix+c` | New tab |
| `prefix+n` / `prefix+p` | Next / previous tab |
| `prefix+1` … `prefix+9` | Jump to tab N |
| `prefix+shift+t` | Rename tab |
| `prefix+shift+x` | Close tab |

### Panes

| Key | Action |
|---|---|
| `prefix+minus` | Horizontal split (new pane below) |
| `prefix+v` | Vertical split (new pane to the right) |
| `prefix+h` / `j` / `k` / `l` | Focus pane in that direction |
| `prefix+tab` / `prefix+shift+tab` | Cycle panes |
| `prefix+z` | Zoom / unzoom current pane (fullscreen) |
| `prefix+r` | Resize mode (then h/j/k/l) |
| `prefix+x` | Close pane |
| `prefix+shift+p` | Rename pane |
| `prefix+e` | Edit scrollback in `$EDITOR` |

### Meta

| Key | Action |
|---|---|
| `prefix+?` | Help — full keymap |
| `prefix+s` | Settings |
| `prefix+b` | Toggle sidebar |
| `prefix+q` | Detach (server keeps running) |
| `prefix+shift+r` | Reload `config.toml` |
| `prefix+o` | Open notification target |

### Git worktrees

| Key | Action |
|---|---|
| `prefix+shift+g` | New worktree from current workspace (opens as a grouped child) |

### Copy mode (scrollback + search)

`prefix+[` enters copy mode on the focused pane — the equivalent of tmux's
copy mode. The pane process keeps running; copy mode just pins the viewport
in history.

| Key | Action |
|---|---|
| `prefix+[` | Enter copy mode |
| `h` `j` `k` `l` / arrows | Move |
| `w` `b` `e` | Word motions (tmux-style) |
| `{` / `}` | Paragraph jump |
| `PageUp` / `PageDown` | Page |
| `ctrl+b` / `ctrl+f` | Half-page back / forward |
| `ctrl+u` / `ctrl+d` | Half-page up / down |
| `/` / `?` | Forward / backward search (smart case) |
| `n` / `N` | Next / previous match |
| `v` or `space` | Start selection |
| `y` or `enter` | Copy selection |
| `q` or `esc` | Exit copy mode |

Mouse drag-select in a pane also copies without entering copy mode.

## Config highlights (`config.toml`)

- `theme.name = "tokyo-night"` with accent `#7aa2f7`
- `keys.prefix = "ctrl+a"` — matches my tmux prefix
- `ui.agent_panel_sort = "spaces"` — sidebar groups agents by workspace
- `ui.show_agent_labels_on_pane_borders = true` — closest analog to the
  status-bar segments I gave up when leaving powerkit
- `ui.sidebar_width = 30` — fits long workspace names like `plans-and-pricing`
- `ui.hide_tab_bar_when_single_tab = true` — cleaner chrome

## Migration status

Running Herdr in parallel with tmux. Not deleting `tmux/` or `tmuxinator/`
yet — tmux stays for SSH shells and legacy workflows during the trial.
Re-evaluate after ~1 month of daily Herdr use.

## Restarting from scratch

```sh
herdr server stop     # kill the running server
rm ~/.config/herdr/session.json  # optional: forget prior workspaces
herdr                 # fresh boot
```

Existing `herdr-*.log` files live alongside `config.toml`; they are not
managed by stow.
