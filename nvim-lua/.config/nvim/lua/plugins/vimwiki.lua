---@diagnostic disable: undefined-global
return {
	"vimwiki/vimwiki",
	event = "BufEnter *.wiki",
	keys = { "<leader>ww", "<leader>wt" },
	init = function()
		vim.g.vimwiki_list = {
			{
				path = "$DROPBOX_DIR/vimwiki/getty",
				syntax = "default",
				ext = ".wiki",
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
		}
		vim.g.vimwiki_option_automatic_nested_syntaxes = 1
		vim.g.vimwiki_hl_headers = 1
		-- moved highlighting to autocmds.lua to load later
	end,
}
