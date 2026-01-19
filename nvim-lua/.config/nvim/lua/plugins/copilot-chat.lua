return {
	"CopilotC-Nvim/CopilotChat.nvim",
	keys = {
		{ "<leader>a", "", desc = "+ai", mode = { "n", "x" } },
		{
			"<leader>aa",
			function()
				return require("CopilotChat").toggle()
			end,
			desc = "CopilotChat Toggle",
			mode = { "n", "x" },
		},
		{
			"<leader>ax",
			function()
				return require("CopilotChat").reset()
			end,
			desc = "CopilotChat Clear",
			mode = { "n", "x" },
		},
		{
			"<leader>aq",
			function()
				vim.ui.input({
					prompt = "Quick Chat: ",
				}, function(input)
					if input ~= "" then
						require("CopilotChat").ask(input)
					end
				end)
			end,
			desc = "CopilotChat Quick Chat",
			mode = { "n", "x" },
		},
		{
			"<leader>ap",
			function()
				require("CopilotChat").select_prompt()
			end,
			desc = "CopilotChat Prompt Actions",
			mode = { "n", "x" },
		},
	},
}
