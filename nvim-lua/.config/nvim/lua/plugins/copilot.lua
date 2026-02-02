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
		-- This model is free
		copilot_model = "gpt-4.1",
		suggestion = {
			enabled = true,
		},
		nes = {
			enabled = true,
			keymap = {
				accept_and_goto = "<leader>p",
				accept = false,
				dismiss = "<Esc>",
			},
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
			gitcommit = true,
			help = true,
			javascript = true,
			lua = true,
			markdown = true,
			ruby = true,
			sh = true,
			typescript = true,
			yaml = true,
			vimwiki = false,
			-- ["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
		},
		workspace_folders = {
			-- "/Users/tim.martin/src/getty/unisporkal/misc_admin/app/javascript/react",
			"/Users/tim.martin/src/getty/unisporkal",
		},
	},
}
