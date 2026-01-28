# Scripts

These scripts will be symlinked to a `scripts` directory in the user's home directory upon installation.

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
