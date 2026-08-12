---@diagnostic disable: undefined-global
return {
	"vimwiki/vimwiki",
	event = { "BufEnter *.wiki", "BufEnter *.md" },
	keys = { "<leader>ww", "<leader>wt" },
	init = function()
		vim.g.vimwiki_list = {
			{
				path = "$DROPBOX_DIR/vimwiki/getty",
				syntax = "markdown",
				ext = ".md",
				name = "Getty",
				diary_caption_level = 0,
			},
			{
				path = "$DROPBOX_DIR/vimwiki/personal",
				path_html = "",
				syntax = "default",
				ext = ".wiki",
				name = "Personal",
				diary_caption_level = 0,
			},
			{
				path = "$ONEDRIVE_DIR/Documents/stories",
				syntax = "markdown",
				ext = ".md",
				name = "Stories",
			},
		}
		vim.g.vimwiki_ext2syntax = {
			[".md"] = "markdown",
			[".markdown"] = "markdown",
			[".mdown"] = "markdown",
		}
		vim.g.vimwiki_option_nested_syntaxes = {
			["python"] = "python",
			["c++"] = "cpp",
			["ruby"] = "ruby",
			["cmd"] = "sh",
			["bash"] = "sh",
			["slim"] = "sass",
			["markdown"] = "md",
		}
		vim.g.vimwiki_option_automatic_nested_syntaxes = 1
		vim.g.vimwiki_hl_headers = 1
		-- moved highlighting to autocmds.lua to load later
		-- Notes re: links
		-- [[path/to/the/file|friendly title]] will create a file
		-- in the directory.  Without path, defaults to current
		-- Cross-wiki links to the Stories wiki (OneDrive) use named interwiki syntax:
		-- [[wn.Stories:2026-08/signin-errors/investigation|Sign-in errors investigation]]
	end,
}
