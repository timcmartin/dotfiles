# AI Tool Keymaps

All AI tools organized under `<leader>a` (no conflicts!)

## CopilotChat (LazyExtra) - Default keymaps
- `<leader>aa` - CopilotChat Toggle
- `<leader>ap` - CopilotChat Prompt Actions (lowercase p)
- `<leader>ax` - CopilotChat Clear
- `<leader>aq` - CopilotChat Quick Chat

## Sidekick (LazyExtra) - 's' for Sidekick
- `<leader>as` - Sidekick Toggle CLI
- `<leader>aS` - Sidekick Select CLI (capital S)
- `<leader>aP` - Sidekick Prompts (capital P)
- `<leader>ad` - Sidekick Detach Session

## CodeCompanion - 'c' for Companion
- `<leader>ac` - CodeCompanion Actions
- `<leader>aC` - CodeCompanion Toggle Chat (capital C)
- `ga` (visual) - Add to CodeCompanion Chat

## Quick Reference
| Key | Tool | Action |
|-----|------|--------|
| `<leader>aa` | CopilotChat | Toggle |
| `<leader>ap` | CopilotChat | Prompt Actions |
| `<leader>aP` | Sidekick | Prompts |
| `<leader>ax` | CopilotChat | Clear |
| `<leader>aq` | CopilotChat | Quick Chat |
| `<leader>as` | Sidekick | Toggle CLI |
| `<leader>aS` | Sidekick | Select CLI |
| `<leader>ad` | Sidekick | Detach Session |
| `<leader>ac` | CodeCompanion | Actions |
| `<leader>aC` | CodeCompanion | Toggle Chat |

## Configuration Files
- Sidekick: `lua/plugins/sidekick.lua` (keymap overrides)
- CopilotChat: `lua/plugins/copilot-chat.lua` (keymap overrides)
- CodeCompanion: `lua/config/keymaps.lua`

## Installation
1. `:LazyExtras` to open extras menu
2. Enable `coding.copilot-chat`
3. Enable `ai.sidekick`
4. `:Lazy sync` to install
