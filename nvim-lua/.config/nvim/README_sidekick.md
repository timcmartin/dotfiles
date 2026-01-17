# Sidekick migration notes

This branch migrates CodeCompanion prompts/config to Sidekick (sidekick.nvim).

## What changed

- Added `lua/config/sidekick.lua` to load Sidekick safely if installed.
- Added `lua/user/sidekick_prompts.md` containing migrated prompts from `system_prompt.md` and `llm_prompts.md`.
- Removed CodeCompanion keymap comments from `lua/config/keymaps.lua`.
- Original CodeCompanion prompt files (`user/system_prompt.md` and `user/llm_prompts.md`) remain unchanged.

## How to enable Sidekick

1. Install sidekick.nvim via LazyExtras or your preferred plugin manager.
2. The configuration in `lua/config/sidekick.lua` will automatically load if sidekick is available.
3. Sidekick will use default model/provider settings unless you customize them.

## How to customize

- Set your provider/model in `lua/config/sidekick.lua` or via your environment variables.
- Example customization in `sidekick.lua`:
  ```lua
  sidekick.setup({
    model = "gpt-4o",
    provider = "openai",
    api_key = os.getenv("OPENAI_API_KEY"),
  })
  ```
- Sidekick will use defaults if no explicit model/provider is set.
- Prompts are stored in `lua/user/sidekick_prompts.md` and can be referenced via the global variable `_G.sidekick_prompts_path`.

## Copilot integration

- Copilot (copilot.lua) can coexist with Sidekick.
- The Sidekick configuration avoids setting or overriding Copilot keymaps by default.
- Both plugins can work together without conflicts.

## To revert to CodeCompanion

- Restore CodeCompanion configuration files from the main branch.
- Remove or disable the sidekick files:
  - `lua/config/sidekick.lua`
  - `lua/user/sidekick_prompts.md`
- Restore the CodeCompanion keymaps in `lua/config/keymaps.lua` if needed.
