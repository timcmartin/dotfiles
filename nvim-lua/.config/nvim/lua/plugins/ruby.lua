-- Ruby LSP setup: ruby-lsp as primary, solargraph alongside for rename support.
-- ruby-lsp does not implement textDocument/rename, so we let solargraph handle
-- rename (and references) while ruby-lsp handles everything else.
return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				ruby_lsp = {
					-- ruby-lsp lacks rename; strip the (incorrectly-advertised) capability
					-- so vim.lsp.buf.rename routes to solargraph instead.
					on_attach = function(client, _)
						if client.server_capabilities then
							client.server_capabilities.renameProvider = false
						end
					end,
				},
				solargraph = {
					cmd = { "bundle", "exec", "solargraph", "stdio" },
					settings = {
						solargraph = {
							diagnostics = false,
							formatting = false,
							completion = false,
							hover = false,
							symbols = false,
							definitions = false,
							typeDefinitions = false,
							references = true,
							rename = true,
							autoformat = false,
						},
					},
					flags = {
						debounce_text_changes = 150,
					},
				},
			},
		},
	},
}
