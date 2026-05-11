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

## pomodoro.sh

For use in tmux status bar.

## recipebook

When used in the `~/src/recipes` repository, will automatically build recipebook.

- Ensure `git remote add book git@github.com:timcmartin/timcmartin.github.io.git` has been executed in the local repository.

## truncate_uniadmin_logs.sh

- Work setup, convenience script to truncate uniadmin logs.

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
