return {
	"folke/sidekick.nvim",
	keys = {
		{
			"<leader>as",
			function()
				require("sidekick.cli").toggle()
			end,
			desc = "Sidekick Toggle CLI",
		},
		{
			"<leader>aS",
			function()
				require("sidekick.cli").select()
			end,
			desc = "Sidekick Select CLI",
		},
		{
			"<leader>aP",
			function()
				require("sidekick.cli").prompt()
			end,
			mode = { "n", "x" },
			desc = "Sidekick Prompts",
		},
		{
			"<leader>ad",
			function()
				require("sidekick.cli").close()
			end,
			desc = "Sidekick Detach Session",
		},
	},
}
