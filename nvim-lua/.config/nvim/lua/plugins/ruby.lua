-- Ruby LSP setup: ruby-lsp only.
return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				ruby_lsp = {},
			},
		},
	},
}
