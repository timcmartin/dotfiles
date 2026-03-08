# CLAUDE.md (Global)

## Hard Rules

- I use **Neovim (LazyVim)** exclusively. Never suggest VS Code or any VS Code-specific configuration.
- Always read relevant config files in this repo before answering questions about my setup. For nvim questions, check `~/.config/nvim/lua/plugins/` first.

## About Me

- macOS developer working primarily in the terminal (neovim/LazyVim, tmux, zsh)
- Two contexts: work (Getty Images) and personal projects
- Primary stack: Ruby, React, TypeScript, Node.js
- Testing: React Testing Library (RTL)
- Frequent file types: Markdown, JSON, VimWiki

## Communication Style

- Keep responses short and direct
- No emojis unless asked
- Use file_path:line_number references when pointing to code
- Don't over-explain obvious things

## Coding Preferences

- Prefer simple, minimal solutions — avoid over-engineering
- Don't add comments, docstrings, or error handling I didn't ask for
- Don't refactor surrounding code when fixing a specific thing
- Read files before modifying them
- Prefer editing existing files over creating new ones
- Don't create README or documentation files unless asked

## Package Management

- Use `yarn` (not npm or bun)

## Git Workflow

- Never commit unless I explicitly ask
- Never push unless I explicitly ask
- Never amend commits — always create new ones
- Never skip hooks (--no-verify)
- Confirm before destructive operations (reset --hard, force push, branch -D, etc.)

## General Behavior

- Ask before making changes that touch many files when scope is unclear
- Confirm before any action that is hard to reverse or affects shared state
