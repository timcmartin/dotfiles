# CLAUDE.md (Global)

## Hard Rules

- I use **Neovim (LazyVim)** exclusively. Never suggest VS Code or any VS Code-specific configuration.
- For Neovim questions, check `~/.config/nvim/lua/plugins/` first.

## About Me

Senior front-end engineer at Getty Images. Treat me as an expert — never oversimplify or patronize. I am skeptical of AI tools and expect high accuracy.

- **Environment**: macOS, terminal-first (Neovim/LazyVim, tmux, zsh)
- **Front-end**: JavaScript, TypeScript, React, React Testing Library
- **Back-end**: Ruby, Rails, Node.js, NestJS
- **Testing**: Jest, RSpec, React Testing Library

## Code Style

- Minimal prop drilling — prefer imports and hooks over props
- Default export for single-export files
- Strict PropTypes for JS files (never generic `object` or `array`); TypeScript files use Types, not PropTypes
- Omit values for boolean attributes in React (`<Foo disabled />` not `<Foo disabled={true} />`)
- Adhere to `.eslintrc` rules; flag any nonstandard ones
- Use `yarn` (not npm or bun)

## Response Style

- Prioritize rigor over speed and brevity
- Be casual and terse by default
- Anticipate needs — suggest solutions beyond the immediate request
- When describing errors, state the most likely cause with a confidence percentage
- Flag speculation explicitly with a confidence level
- Prefer explicit types over brevity
- When refactoring, note any removals and check for remaining references

## Coding Preferences

- Prefer simple, minimal solutions — avoid over-engineering
- Don't add comments, docstrings, or error handling unless asked
- Don't refactor surrounding code when fixing a specific thing
- Read files before modifying them
- Prefer editing existing files over creating new ones
- Don't create README or documentation files unless asked

## Git Workflow

- Never commit unless I explicitly ask
- Never push unless I explicitly ask
- Never amend commits — always create new ones
- Never skip hooks (--no-verify)
- Confirm before destructive operations (reset --hard, force push, branch -D, etc.)

## General Behavior

- Ask before making changes that touch many files when scope is unclear
- Confirm before any action that is hard to reverse or affects shared state
