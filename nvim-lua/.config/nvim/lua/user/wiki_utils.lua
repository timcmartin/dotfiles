local M = {}

function M.generate_wiki_header()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local sections = {}
  local title_line_index = nil

  -- Extract date from filename (format: YYYY-MM-DD.md)
  local filename = vim.fn.expand("%:t:r") -- Get filename without extension
  local year, month, day = filename:match("^(%d%d%d%d)%-(%d%d)%-(%d%d)$")

  local date = nil
  if year and month and day then
    -- Convert month number to month name
    local month_names = {
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    }
    local month_name = month_names[tonumber(month)]

    if month_name then
      -- Format date like "Aug 05, 2025" (Canadian/North American format)
      date = string.format(
        "%s %s, %s",
        month_name,
        day, -- Keep the leading zero for day
        year
      )
    end
  end

  -- Find the existing title (first level 1 heading) and collect level 2 headings
  for i, line in ipairs(lines) do
    if title_line_index == nil and line:match("^#%s+%S") then
      title_line_index = i - 1 -- 0-based index
    elseif line:match("^##%s+%S") then
      local content = line:gsub("^##%s+", ""):gsub("%s+$", "")
      table.insert(sections, content)
    end
  end

  if date and #sections > 0 then
    local header = "# " .. table.concat(sections, ", ") .. ", " .. date

    if title_line_index ~= nil then
      -- Replace the existing title in place
      vim.api.nvim_buf_set_lines(0, title_line_index, title_line_index + 1, false, { header })
    else
      local new_lines = { header }
      if lines[1] ~= nil and lines[1] ~= "" then
        table.insert(new_lines, "")
      end
      vim.api.nvim_buf_set_lines(0, 0, 0, false, new_lines)
    end
    print("Header updated at the top of the file.")
  else
    print("No valid date or sections found.")
  end
end

return M
