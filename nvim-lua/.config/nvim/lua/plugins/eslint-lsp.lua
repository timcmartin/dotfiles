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
				before_init = function(_, config)
					local root_dir = config.root_dir
					if not root_dir then
						return
					end

					-- Replicate nvim-lspconfig's default eslint before_init so this
					-- override doesn't clobber it (workspaceFolder + Yarn PnP support).
					config.settings = config.settings or {}
					config.settings.workspaceFolder = {
						uri = vim.uri_from_fname(root_dir),
						name = vim.fn.fnamemodify(root_dir, ":t"),
					}
					local pnp_cjs = root_dir .. "/.pnp.cjs"
					local pnp_js = root_dir .. "/.pnp.js"
					if type(config.cmd) == "table" and (vim.uv.fs_stat(pnp_cjs) or vim.uv.fs_stat(pnp_js)) then
						config.cmd = vim.list_extend({ "yarn", "exec" }, config.cmd)
					end

					-- Unisporkal (Uni-ADR-027) uses pnpm nodeLinker: isolated with an
					-- empty publicHoistPattern, so the shared @unisporkal/linting config's
					-- plugins (eslint-plugin-react etc.) are NOT hoisted to the project
					-- root where the LSP resolves plugins by default. Point the ESLint
					-- server at the config package's real (symlink-resolved) location so
					-- it finds the plugins as siblings, exactly like the CLI does.
					local real = vim.uv.fs_realpath(root_dir .. "/node_modules/@unisporkal/linting")
					if real then
						config.settings.options = config.settings.options or {}
						config.settings.options.resolvePluginsRelativeTo = real
					end
				end,
			},
		},
	},
}
