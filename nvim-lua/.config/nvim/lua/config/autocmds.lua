-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_augroup("TrimWhitespace", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = "TrimWhitespace",
	pattern = "*",
	command = [[%s/\s\+$//e | %s/\n\+\%$//e]],
})

-- call with :WikiHeader
vim.api.nvim_create_user_command("WikiHeader", function()
	require("user.wiki_utils").generate_wiki_header()
end, {})

-- Create a new group for wiki diary headers
vim.api.nvim_create_augroup("WikiDiary", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = "WikiDiary",
	pattern = "*/vimwiki/getty/diary/*.wiki",
	callback = function()
		-- Get the current buffer's filename
		local filename = vim.fn.expand("%:t")

		-- Skip if the filename is diary.wiki
		if filename ~= "diary.wiki" then
			require("user.wiki_utils").generate_wiki_header()
		end
	end,
	desc = "Generate wiki header for diary entries except for diary.wiki",
})

-- Syntax for TodoTxt
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "todo.txt",
	callback = function()
		vim.cmd("set filetype=todotxt")
	end,
})

-- Parse prompts from MD
vim.api.nvim_create_user_command("ParsePrompts", function()
	require("user.parse_prompts_util").parse_prompts_from_markdown()
end, {})

-- Vimwiki highlights
vim.cmd([[
      hi VimwikiHeader1 guifg=#82aaff
      hi VimwikiHeader2 guifg=#c099ff
      hi VimwikiHeader3 guifg=#c3e88d
      hi VimwikiHeader4 guifg=#ffc777
      hi VimwikiHeader5 guifg=#ff966c
      hi VimwikiLink guifg=#82aaff" gui=underline
      hi VimwikiListTodo guifg=#4fd6be
    ]])
