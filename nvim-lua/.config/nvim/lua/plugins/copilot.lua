return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	build = ":Copilot auth",
	opts = {
		suggestion = { enabled = true },
		panel = {
			enabled = true,
			auto_refresh = true,
			layout = {
				position = "right",
				size = 40,
			},
		},
		filetypes = {
			markdown = true,
			help = true,
			javascript = true,
			typescript = true,
			ruby = true,
			gitcommit = true,
		},
	},
}
