return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			eslint = {
				cmd = function(dispatchers, config)
					local bin = "vscode-eslint-language-server"
					if config and config.root_dir then
						local local_bin = vim.fs.joinpath(config.root_dir, "node_modules/.bin", bin)
						if vim.fn.executable(local_bin) == 1 then
							bin = local_bin
						end
					end
					return vim.lsp.rpc.start({ bin, "--stdio" }, dispatchers, { env = { NODE_ENV = "test" } })
				end,
			},
		},
	},
}
