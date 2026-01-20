# dev Folder

This folder contains project-specific helpers (scripts, config files, info files, etc.) that are not stored in their respective project repositories, but are kept here for reference and reuse. The intention is to be able to `stow` these files into a `.dev` folder within a project repo as needed.

## Structure
- Each subfolder (e.g., `uniadmin/`) contains helpers for a specific project.
- Files may include scripts, configuration files, and documentation relevant to the project.
- `.stow-local-ignore` is used to control which files are ignored by stow.

## Usage
- Reference or copy helpers as needed for your projects.
- Use GNU Stow to symlink desired helpers into a project's `.dev` directory.

### Example: Stowing misc_admin helpers
To symlink the contents of `dev/misc_admin` into your project's `.dev/misc_admin` directory, run the following from within the `dev/misc_admin` directory:

```sh
mkdir -p "$UNISPORKAL/misc_admin/.dev"
cd dev/misc_admin
stow -t "$UNISPORKAL/misc_admin/.dev" .
```

## Example: misc_admin/
- `token.rb`: Ruby script to extract a secure token from a URL.
- `codecompanion-workspace.json`: VSCode workspace settings (large file).
- `eslintrc.json`: ESLint configuration for JavaScript/React.
- `coc-settings.json`: Editor (CoC) settings for TypeScript, ESLint, Prettier, etc.
- `README.md`: Project-specific notes for misc_admin.
