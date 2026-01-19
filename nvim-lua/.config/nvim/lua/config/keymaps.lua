-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<ESC>", { silent = true })
vim.keymap.set("t", "jj", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })
-- Formatting Convenience
vim.keymap.set("n", "<leader>txt", ":set ft=txt<CR>", {})
vim.keymap.set("n", "<leader>md", ":set ft=markdown<CR>", {})
vim.keymap.set("n", "<localleader>js", ":set ft=javascript<CR>", {})
-- DateTime
vim.keymap.set("i", "<F5>", '<C-R>=strftime("%b %d, %Y")<CR>', {})
-- Managing Tabs & Navigation
vim.keymap.set({ "n", "v", "i" }, "<leader>tn", ":tabnew<CR>", {})
vim.keymap.set({ "n", "v", "i" }, "<leader>to", ":tabonly<CR>", {})
vim.keymap.set({ "n", "v", "i" }, "<leader>tc", ":tabclose<CR>", {})
vim.keymap.set({ "n", "v", "i" }, "<leader>tm", ":tabmove<space>", {})
vim.keymap.set("n", "th", ":tabfirst<CR>", {})
vim.keymap.set("n", "tj", ":tabnext<CR>", {})
vim.keymap.set("n", "tk", ":tabprev<CR>", {})
vim.keymap.set("n", "tl", ":tablast<CR>", {})
vim.keymap.set("n", "td", ":tabclose<CR>", {})
-- Relative Filename
vim.keymap.set("n", "<leader>fn", function()
	local relpath = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
	vim.fn.setreg("+", relpath)
	print("Copied: " .. relpath)
end, {})
-- Absolute Filename
vim.keymap.set("n", "<leader>fa", function()
	local abspath = vim.api.nvim_buf_get_name(0)
	vim.fn.setreg("+", abspath)
	print("Copied: " .. abspath)
end, {})
-- Vimwiki Diary Note
vim.keymap.set({ "n", "v", "i" }, "<leader>dd", ":VimwikiMakeDiaryNote", {})
-- Resize
vim.keymap.set("n", "<leader><Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<leader><Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<leader><Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
vim.keymap.set("n", "<leader><Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

-- AI Tools Keymaps
vim.keymap.set(
	{ "n", "v" },
	"<leader>ac",
	"<cmd>CodeCompanionActions<cr>",
	{ noremap = true, silent = true, desc = "CodeCompanion Actions" }
)
vim.keymap.set(
	{ "n", "v" },
	"<leader>as",
	"<cmd>SidekickActions<cr>",
	{ noremap = true, silent = true, desc = "Sidekick Actions" }
)
vim.keymap.set(
	{ "n", "v" },
	"<leader>at",
	"<cmd>SomeOtherAITool<cr>",
	{ noremap = true, silent = true, desc = "Other AI Tool" }
) -- optional placeholder

-- CodeCompanion Chat
vim.keymap.set(
	{ "n", "v" },
	"<localleader>ac",
	"<cmd>CodeCompanionChat Toggle<cr>",
	{ noremap = true, silent = true, desc = "Toggle CodeCompanion Chat" }
)
vim.keymap.set(
	"v",
	"ga",
	"<cmd>CodeCompanionChat Add<cr>",
	{ noremap = true, silent = true, desc = "Add to CodeCompanion Chat" }
)

-- Sidekick Chat (example, adjust as needed)
vim.keymap.set(
	{ "n", "v" },
	"<localleader>as",
	"<cmd>SidekickChat Toggle<cr>",
	{ noremap = true, silent = true, desc = "Toggle Sidekick Chat" }
)

vim.keymap.set(
	"n",
	"<leader>js",
	":r ~/Dotfiles/vim/boilerplate/javascriptreact.txt<CR>",
	{ noremap = true, silent = true }
)
-- Open Getty Diary
vim.keymap.set(
	"n",
	"<localleader>gd",
	":e /Users/tim.martin/Library/CloudStorage/Dropbox/vimwiki/getty/diary/diary.wiki<CR>",
	{ noremap = true, silent = true }
)
-- Open Getty Index
vim.keymap.set(
	"n",
	"<localleader>gi",
	":e /Users/tim.martin/Library/CloudStorage/Dropbox/vimwiki/getty/index.wiki<CR>",
	{ noremap = true, silent = true }
)
-- Unused Buffers
vim.keymap.set("n", "<localleader>b", function()
	local curbufnr = vim.api.nvim_get_current_buf()
	local buflist = vim.api.nvim_list_bufs()
	for _, bufnr in ipairs(buflist) do
		if vim.bo[bufnr].buflisted and bufnr ~= curbufnr and (vim.fn.getbufvar(bufnr, "bufpersist") ~= 1) then
			vim.cmd("bd " .. tostring(bufnr))
		end
	end
end, { silent = true, desc = "Close unused buffers" })
-- Yank Diagnostic Error
vim.keymap.set(
	"n",
	"<localleader>e",
	[[:lua YankDiagnosticError()<CR>]],
	{ noremap = true, silent = true, desc = "Copy error" }
)
function YankDiagnosticError()
	vim.diagnostic.open_float()
	vim.diagnostic.open_float()
	local win_id = vim.fn.win_getid() -- get the window ID of the floating window
	vim.cmd("normal! j") -- move down one row
	vim.cmd("normal! VG") -- select everything from that row down
	vim.cmd("normal! y") -- yank selected text
	vim.api.nvim_win_close(win_id, true) -- close the floating window by its ID
end
-- Other.nvim
vim.keymap.set("n", "<localleader>of", "<cmd>:OtherVSplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>rp", function()
	-- Convert a UniAdmin route to a grep pattern
	local line = vim.api.nvim_get_current_line()
	-- First escape slashes, then replace :parameters with .*
	line = line:gsub("/", "\\/"):gsub(":[^/]+", ".*")
	vim.api.nvim_set_current_line(line)
end, { desc = "Convert route to pattern" })
-- Gitlab
vim.keymap.set("n", "<leader>rg", function()
	local prefix = "/Users/tim.martin/src/getty/unisporkal/misc_admin/"
	local base_url = "https://gitlab.getty.cloud/unisporkal/misc-admin-app/-/blob/master/"
	local line = vim.api.nvim_get_current_line()
	local path = line
	if vim.startswith(line, prefix) then
		path = line:sub(#prefix + 1)
	end
	local url = base_url .. path
	vim.api.nvim_set_current_line(url)

	-- Open in browser
	local open_cmd
	if vim.fn.has("mac") == 1 then
		open_cmd = { "open", url }
	elseif vim.fn.has("unix") == 1 then
		open_cmd = { "xdg-open", url }
	elseif vim.fn.has("win32") == 1 then
		open_cmd = { "start", url }
	end
	if open_cmd then
		vim.fn.jobstart(open_cmd, { detach = true })
	end

	-- Copy to clipboard
	if vim.fn.has("mac") == 1 then
		vim.fn.setreg("+", url)
	elseif vim.fn.has("unix") == 1 then
		vim.fn.setreg("+", url)
	elseif vim.fn.has("win32") == 1 then
		vim.fn.setreg("+", url)
	end
end, { desc = "Convert local path to GitLab URL, open in browser, and copy to clipboard" })
-- TODO.txt
vim.keymap.set("n", "<leader>te", function()
	local path = vim.fn.expand("$HOME/Dropbox/Apps/Todotxt+/todo.txt")
	vim.cmd("vsplit " .. vim.fn.fnameescape(path))
end, { noremap = true, silent = true, desc = "Open todo.txt in vsplit" })
-- lsp
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "gF", vim.lsp.buf.format, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<localleader>rn", vim.lsp.buf.rename, {})
