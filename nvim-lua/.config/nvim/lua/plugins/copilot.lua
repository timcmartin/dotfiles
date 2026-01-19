return {
	"zbirenbaum/copilot.lua",
	dependencies = {
		"copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
	},
	cmd = "Copilot",
	event = "InsertEnter",
	--event = "BufReadPost",
	build = ":Copilot auth",
	opts = {
		copilot_model = "gpt-4.1",
		suggestion = {
			enabled = true,
		},
		nes = {
			enabled = true,
		},
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
		workspace_folders = {
			"/Users/tim.martin/src/getty/unisporkal/misc_admin/app/javascript/react",
		},
	},
}
