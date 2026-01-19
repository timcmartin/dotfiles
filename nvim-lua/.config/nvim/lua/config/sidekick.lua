-- Safe sidekick.nvim configuration
local ok, sidekick = pcall(require, "sidekick")
if not ok then
  -- sidekick.nvim not installed or not available; nothing to configure here.
  return
end

-- Minimal setup: keep defaults and provide comments for user customization.
sidekick.setup({
  -- Leave defaults so Sidekick uses whatever backend/plugin default is configured.
  -- To customize, supply model/provider configuration here, for example:
  -- model = "gpt-4o",
  -- provider = "openai",
  -- api_key = os.getenv("OPENAI_API_KEY"),

  -- Optional: If you want Sidekick to interoperate with copilot suggestions, you
  -- can add hooks here. We avoid setting or overriding copilot keymaps by default.
})

-- Optional: Make sidekick prompts directory available via a global variable
-- so users or other plugins can find them easily. Adjust path if necessary.
_G.sidekick_prompts_path = vim.fn.stdpath("config") .. "/lua/user/sidekick_prompts.md"
