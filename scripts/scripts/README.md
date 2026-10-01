# Scripts

These scripts will be symlinked to a `scripts` directory in the user's home directory upon installation.

## all_apps.sh

Work setup. Opens GitLab pipeline pages for all Unisporkal apps and release monitoring dashboards (Grafana, Splunk) in the browser.

## git-repos.sh

Lists git branch and status for immediate subdirectories of a given path.

### Usage

```sh
git-repos [path]
git-repos --dirty    # only repos with uncommitted changes
git-repos --ahead    # include upstream ahead/behind counts
git-repos --simple   # compact "dir branch" output
git-repos --help
```

## independent-branches.sh

Creates independent branches from a base branch, each containing a single cherry-picked commit. Useful for splitting a multi-commit branch into separate PRs that don't depend on each other.

## stacked-branches.sh

Creates stacked branches where each branch builds on the previous one. Useful for splitting a multi-commit branch into a chain of dependent PRs.

## update-cla.sh

Updates CLA (Content License Agreement) PDF files for Getty or iStock in the Unisporkal repo from an extracted PDF folder.

### Usage

```sh
update-cla.sh <getty|istock> <path-to-extracted-PDF-folder>
```

## recipebook

When used in the `~/src/recipes` repository, will automatically build recipebook.

- Ensure `git remote add book git@github.com:timcmartin/timcmartin.github.io.git` has been executed in the local repository.

## truncate_uniadmin_logs.sh

- Work setup, convenience script to truncate uniadmin logs.

## yarn-pnpm.sh

Migrates immediate subdirectories from yarn to pnpm. For each subdirectory, checks out `master` (or `main`), pulls, removes `node_modules` and `yarn.lock`, then runs `pnpm install`. Non-git directories skip the checkout/pull step.

### Usage

```sh
yarn-pnpm.sh [path]
```

If `[path]` is omitted, the current working directory is used.

## backup_nvim.sh

Backs up your Neovim configuration and data directories to timestamped backup folders, restores sessions, and can optionally install the LazyVim starter config.

### Usage

```sh
./backup_nvim.sh [--no-restore-sessions] [--no-lazyvim] [--help]
```

### Options

- `--no-restore-sessions`
  Do not restore Neovim sessions after backup.

- `--no-lazyvim`
  Do not install LazyVim after backup.

- `--help`
  Show usage information.

By default, the script:

- Moves your Neovim config/data/state/cache directories to backup folders with a timestamp.
- Restores your previous Neovim sessions.
- Installs the LazyVim starter config.

## reap-orphans.sh

Finds — and optionally kills — dev processes left behind when a herdr workspace, tab, or pane is closed.

Closing a workspace kills the pane shells, but tooling that has detached from them (Spring servers, ruby-lsp's `rails runner`, language servers, file watchers) is reparented to launchd and keeps running. It holds memory and counts against `kern.maxprocperuid` (6000) — the ceiling that makes panes fail to start with `fork failed: resource temporarily unavailable`.

A process is only reported when its git project root has no live herdr pane, so tooling for a project that is still open is left alone. Also reports spaceship prompt jobs wedged under an async worker.

### Usage

```sh
reap-orphans.sh           # dry run — list what would be reaped
reap-orphans.sh --kill    # SIGTERM, then SIGKILL to any stragglers
```

Dry run is the default. A dev server that was deliberately backgrounded before its pane was closed looks identical to debris, so read the list before passing `--kill`.

### Notes

- Detection is allowlist-based (`spring`, `ruby-lsp`, `solargraph`, `puma`, `sidekiq`, language servers, `jest`, `vitest`, `vite`, `webpack`, watchers). Tooling outside that list needs adding to `dev_re` in the script.
- Spring is the usual culprit and survives its parent by design — quitting Neovim first does not clean it up. Run `spring stop` in the project before closing it to avoid the leak at source, or set `DISABLE_SPRING=1` to turn it off entirely.
