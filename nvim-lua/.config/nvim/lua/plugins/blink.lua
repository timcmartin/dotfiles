return {
	"saghen/blink.cmp",
	opts = {
		enabled = function()
			return vim.bo.filetype ~= "vimwiki"
		end,
	},
}
