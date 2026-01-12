# Bash Aliases Organization

This directory contains a modular alias system that supports both work and personal environments.

## Files

### `.bash_aliases` (main file)
Common aliases used across all machines, including:
- Git commands
- Rails/development tools
- System administration shortcuts
- Directory navigation
- Vim shortcuts

This file sources the context-specific files below.

### `.bash_aliases.work`
**Getty Images-specific aliases** including:
- AWS profile management
- CIU (Curated Image Uploader) commands
- Cypress testing shortcuts
- GI Proxy and Rails services
- Database management
- Monorepo management (unisporkal)
- Project directory shortcuts

### `.bash_aliases.personal`
**Personal project aliases** including:
- Personal code directories (cabin, recipes, workdev, etc.)

## Usage

### For work machines
Source `.bash_aliases` normally - it will automatically load `.bash_aliases.work` if available.

### For personal machines
Edit your shell rc file (`.bashrc` or `.zshrc`) to conditionally source:

```bash
# Load aliases
source ~/.dotfiles/bash/.bash_aliases

# Skip work aliases on personal machines
# (just don't symlink .bash_aliases.work, or comment out the source line)
```

Or rename/remove `.bash_aliases.work` on personal machines.

### For machine-specific overrides
Create `~/.bash_aliases.local` (not version controlled) with machine-specific aliases:

```bash
# ~/.bash_aliases.local
alias mylocal="some-command-specific-to-this-machine"
```

## Migration Notes

**Duplicates removed:**
- `aliasedit` / `editalias` → kept `editalias`
- `ag` / `Ag` → kept both (case sensitivity)
- `::` / `...` → kept `...` (both cd ../..)
- `uniadmin` / `misc_admin` → both point to same location, kept both

**Old backup:** `.bash_aliases.bak` contains the original combined file if needed for reference.
