local M = {}

function M.parse_prompts_from_markdown(filepath)
  local prompts = {}
  local current_section = nil
  local current_role = nil
  local current_content = {}
  local function trim(s)
    return (s:gsub("^%s+", ""):gsub("%s+$", ""))
  end

  local file = io.open(filepath, "r")
  if not file then
    print("Could not open prompts file: " .. filepath)
    return {}
  end

  for line in file:lines() do
    local section = line:match("^##%s*(%w+)")
    if section then
      -- Save previous prompt if any
      if current_section and current_role and #current_content > 0 then
        table.insert(prompts[current_section].prompts, {
          role = current_role,
          content = trim(table.concat(current_content, "\n")),
        })
      end
      current_section = section
      prompts[current_section] = { prompts = {} }
      current_role = nil
      current_content = {}
    else
      local role = line:match("^%*%*(%w+):%*%*")
      if role then
        -- Save previous role block
        if current_section and current_role and #current_content > 0 then
          table.insert(prompts[current_section].prompts, {
            role = current_role,
            content = trim(table.concat(current_content, "\n")),
          })
        end
        current_role = role:lower()
        current_content = {}
      elseif current_role then
        table.insert(current_content, line)
      end
    end
  end

  -- Save last prompt
  if current_section and current_role and #current_content > 0 then
    table.insert(prompts[current_section].prompts, {
      role = current_role,
      content = trim(table.concat(current_content, "\n")),
    })
  end

  file:close()
  return prompts
end

--- DRY helper: load a single prompt's content by section and (optionally) role
-- @param filepath string: path to markdown file
-- @param section_name string: section header (e.g. "SystemPrompt")
-- @param role string|nil: role (e.g. "system"), or nil for first prompt in section
-- @return string|nil: prompt content, or nil if not found
function M.load_prompt_content(filepath, section_name, role)
  local parsed = M.parse_prompts_from_markdown(filepath)
  local section = parsed[section_name]
  if section and section.prompts then
    for _, prompt in ipairs(section.prompts) do
      if not role or prompt.role == role then
        return prompt.content
      end
    end
  end
  return nil
end

return M
