local M = {}

function M.generate_wiki_header()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local sections = {}
  local title_line_index = nil

  -- Extract date from filename (format: YYYY-MM-DD.wiki)
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

  -- Check if first line is already a header
  local first_line = lines[1]
  if first_line and first_line:match("^=%s*(.-)%s*=$") then
    title_line_index = 0 -- 0-based index of the first line
  end

  -- Scan the document for section headers - ONLY level 2 headers
  for i, line in ipairs(lines) do
    -- Use a pattern that matches EXACTLY two equal signs at the start followed by a space,
    -- content, then a space followed by EXACTLY two equal signs at the end
    if line:match("^==[ ]") and line:match("[ ]==$") then
      -- Extract the content between the equal signs
      local content = line:sub(3, -3) -- Remove the first two and last two characters
      content = content:match("^%s*(.-)%s*$") -- Trim whitespace
      table.insert(sections, content)
    end
  end

  if date and #sections > 0 then
    local header = "= " .. table.concat(sections, ", ") .. ", " .. date .. " ="

    -- Remove existing title line if found
    if title_line_index ~= nil then
      vim.api.nvim_buf_set_lines(0, title_line_index, title_line_index + 1, false, {})
    end

    -- Insert new header at the top
    vim.api.nvim_buf_set_lines(0, 0, 0, false, { header })
    print("Header updated at the top of the file.")
  else
    print("No valid date or sections found.")
  end
end

return M
