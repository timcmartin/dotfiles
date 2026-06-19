-- Loads the getty copilot-shim artifacts under ~/.copilot/ and exposes them as
-- CodeCompanion prompt_library entries.
--
-- Maps:
--   ~/.copilot/vscode-prompts/<name>.prompt.md  ->  Cli<PascalName>
--   ~/.copilot/skills/<name>/SKILL.md           ->  Skill<PascalName>
--   ~/.copilot/copilot-instructions.md          ->  exposed via M.instructions_path()
--
-- Caveats (do not pretend otherwise):
--   * Skills do not auto-trigger here. CodeCompanion has no skill-discovery
--     harness; entries are only invoked when you explicitly pick them.
--   * Subagent dispatch ("dispatch the foo-reviewer subagent") in prompt
--     bodies degrades to in-thread instructions — there is no dispatcher.
--   * VS Code-only frontmatter keys (tools, agent) are stripped.

local M = {}

local function trim(s)
  return (s:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function read_file(path)
  local f = io.open(path, "r")
  if not f then return nil end
  local content = f:read("*a")
  f:close()
  return content
end

-- Parse YAML-ish frontmatter delimited by --- ... ---. We only need a small
-- subset (description, argument-hint) so a regex pass is sufficient — no
-- general YAML support, just `key: "..."` or `key: ...` per line.
local function split_frontmatter(content)
  local fm, body = content:match("^%-%-%-\n(.-)\n%-%-%-\n(.*)$")
  if not fm then
    return {}, content
  end
  local meta = {}
  for line in fm:gmatch("[^\n]+") do
    local k, v = line:match("^([%w_-]+):%s*(.*)$")
    if k and v then
      v = trim(v)
      v = v:gsub('^"(.*)"$', "%1"):gsub("^'(.*)'$", "%1")
      meta[k] = v
    end
  end
  return meta, body
end

local function pascal_case(name)
  local out = name:gsub("[-_](%w)", function(c) return c:upper() end)
  return out:sub(1, 1):upper() .. out:sub(2)
end

local function home(p)
  return (p:gsub("^~", os.getenv("HOME") or ""))
end

local function exists(path)
  return vim.uv.fs_stat(path) ~= nil
end

local function list_glob(pattern)
  local hits = vim.fn.glob(pattern, true, true)
  return hits or {}
end

-- Build one prompt_library entry from the parsed pieces.
local function make_entry(display_name, description, body)
  return {
    strategy = "chat",
    description = description or display_name,
    opts = {
      is_default = false,
      short_name = display_name,
    },
    prompts = {
      {
        role = "user",
        content = body,
      },
    },
  }
end

-- Walk ~/.copilot/vscode-prompts/*.prompt.md
local function load_prompts()
  local out = {}
  local dir = home("~/.copilot/vscode-prompts")
  if not exists(dir) then return out end
  for _, path in ipairs(list_glob(dir .. "/*.prompt.md")) do
    local content = read_file(path)
    if content then
      local meta, body = split_frontmatter(content)
      local base = vim.fn.fnamemodify(path, ":t:r"):gsub("%.prompt$", "")
      local key = "Cli" .. pascal_case(base)
      out[key] = make_entry(key, meta.description, trim(body))
    end
  end
  return out
end

-- Walk ~/.copilot/skills/*/SKILL.md
local function load_skills()
  local out = {}
  local root = home("~/.copilot/skills")
  if not exists(root) then return out end
  for _, path in ipairs(list_glob(root .. "/*/SKILL.md")) do
    local content = read_file(path)
    if content then
      local meta, body = split_frontmatter(content)
      local skill_dir = vim.fn.fnamemodify(path, ":h:t")
      local key = "Skill" .. pascal_case(skill_dir)
      local desc = meta.description
        or ("Skill: " .. skill_dir .. " (manual; no auto-trigger in Neovim)")
      -- Prepend a one-line note so the model knows this was an auto-trigger
      -- skill in its native habitat. Stops it from saying "I would auto-load
      -- this..." when the user explicitly invoked it.
      local prelude = ("[Skill `%s` invoked manually from Neovim. Apply it as a normal task instruction.]\n\n"):format(skill_dir)
      out[key] = make_entry(key, desc, prelude .. trim(body))
    end
  end
  return out
end

--- Returns a merged prompt_library table for CodeCompanion.
--- @return table
function M.prompt_library()
  local lib = {}
  for k, v in pairs(load_prompts()) do lib[k] = v end
  for k, v in pairs(load_skills()) do lib[k] = v end
  return lib
end

--- Path to ~/.copilot/copilot-instructions.md if present, else nil.
--- @return string|nil
function M.instructions_path()
  local p = home("~/.copilot/copilot-instructions.md")
  if exists(p) then return p end
  return nil
end

return M
