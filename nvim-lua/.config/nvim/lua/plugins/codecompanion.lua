local prompt_utils = require("user.parse_prompts_util")
local config_path = vim.fn.stdpath("config") .. "/lua/user/"
local llm_prompts = prompt_utils.parse_prompts_from_markdown(config_path .. "llm_prompts.md")

return {
	"olimorris/codecompanion.nvim",
	tag = "v17.33.0", -- Breaking change message popped up Dec 1, 2025
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"j-hui/fidget.nvim", -- Display status
	},
	opts = {
		log_level = "DEBUG",
		-- Place all plugin options here, following the new style
		strategies = {
			chat = {
				adapter = {
					name = "copilot",
					model = "gpt-4.1",
				},
				roles = {
					user = "Tim",
				},
				slash_commands = {
					["file"] = {
						opts = {
							provider = "snacks",
						},
					},
					["buffer"] = {
						keymaps = {
							modes = {
								i = "<C-b>",
							},
						},
						opts = {
							provider = "snacks",
						},
					},
					["fetch"] = {
						keymaps = {
							modes = {
								i = "<C-f>",
							},
						},
					},
					["help"] = {
						opts = {
							max_lines = 1000,
						},
					},
					["image"] = {
						keymaps = {
							modes = {
								i = "<C-i>",
							},
						},
						opts = {
							dirs = { "~/Documents/Screenshots" },
						},
					},
				},
			},
			inline = {
				adapter = {
					name = "copilot",
					model = "gpt-4.1",
				},
			},
		},
		display = {
			diff = {
				enabled = true,
				close_chat_at = 240,
				layout = "vertical",
				opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
				provider = "mini_diff",
			},
			header = {
				welcome = {
					"Welcome to CodeCompanion!",
					"Ask me anything about your code.",
					"Use /file or /buffer to get context-aware help.",
					"Type /help for a list of commands.",
				},
			},
			action_palette = {
				provider = "default",
			},
			chat = {
				icons = {
					tool_success = "󰸞 ",
				},
			},
		},
		prompt_library = (function()
			local names = {
				"RefactorAttach",
				"RefactorPaste",
				"DRY",
				"DRYPaste",
				"UnitTests",
				"UnitTestsInsert",
				"Generate",
				"FillMergeRequestTemplate",
			}
			local descriptions = {
				RefactorAttach = "Refactor the attached code...",
				RefactorPaste = "Refactor the following code...",
				DRY = "Don't Repeat Yourself",
				DRYPaste = "Don't Repeat Yourself",
				UnitTests = "Generate tests for the attached code...",
				UnitTestsInsert = "Generate tests for the following code...",
				Generate = "Generate code",
				FillMergeRequestTemplate = "Fill out a Merge Request template based on the diff and code context.",
			}
			local lib = {}
			for _, name in ipairs(names) do
				lib[name] = {
					strategy = "chat",
					description = descriptions[name],
					opts = {},
					prompts = llm_prompts[name] and llm_prompts[name].prompts or {},
				}
			end
			return lib
		end)(),
		opts = {
			system_prompt = function()
				local content =
					prompt_utils.load_prompt_content(config_path .. "system_prompt.md", "SystemPrompt", "system")
				if content then
					return content
				end
				vim.notify("SystemPrompt not found in system_prompt.md", vim.log.levels.ERROR)
				return ""
			end,
		},
	},
	init = function()
		vim.cmd([[cab cc CodeCompanion]])
		require("plugins.custom.spinner"):init()
	end,
}
