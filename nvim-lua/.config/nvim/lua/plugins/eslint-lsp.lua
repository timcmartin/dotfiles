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
					-- Pin the server's process cwd to the project root. @babel/eslint-parser
					-- locates babel.config.js relative to process.cwd() (not ESLint's cwd
					-- option), so if Neovim spawns the server from another directory babel
					-- can't find the config. Running from root matches how the CLI works.
					local cwd = config and config.root_dir or nil
					return vim.lsp.rpc.start({ bin, "--stdio" }, dispatchers, { cwd = cwd, env = { NODE_ENV = "test" } })
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

					-- Unisporkal (Uni-ADR-027) uses pnpm nodeLinker: isolated with an empty
					-- publicHoistPattern (enforced by @unisporkal/pnpm-plugin-config), so the
					-- shared @unisporkal/linting config's eslint plugins (eslint-plugin-react
					-- etc.) are NOT hoisted to the project root where the LSP resolves plugins
					-- by default. Point ESLint's plugin resolution at the config package's real
					-- (symlink-resolved) location so it finds them as siblings, like the CLI.
					local linting = vim.uv.fs_realpath(root_dir .. "/node_modules/@unisporkal/linting")
					if linting then
						config.settings.options = config.settings.options or {}
						config.settings.options.resolvePluginsRelativeTo = linting
					end

					-- That resolvePluginsRelativeTo base, however, is also where
					-- @babel/eslint-parser resolves @unisporkal/babel-preset's *bare-named*
					-- presets/plugins from, and under the strict pnpm layout those aren't
					-- reachable -> "[BABEL] Cannot find module '...'". The eslint CLI resolves
					-- them because babel's upward node_modules walk reaches the project root;
					-- the missing piece is a top-level symlink for each. pnpm's hoistPattern
					-- flat-links every package into node_modules/.pnpm/node_modules, so we
					-- self-heal a root-level link for exactly the modules the preset names by
					-- bare string that aren't otherwise hoisted. Idempotent, scoped to pnpm
					-- projects that have them (no-op elsewhere), and survives reinstalls since
					-- it runs on every LSP start.
					local store = root_dir .. "/node_modules/.pnpm/node_modules/"
					local bare_deps = {
						"@unisporkal/babel-plugin-lazy-component",
						"@babel/preset-env",
						"@babel/helper-plugin-utils",
						"babel-plugin-transform-react-remove-prop-types",
					}
					for _, mod in ipairs(bare_deps) do
						local link = root_dir .. "/node_modules/" .. mod
						if not vim.uv.fs_stat(link) then
							local target = vim.uv.fs_realpath(store .. mod)
							if target then
								local parent = vim.fn.fnamemodify(link, ":h")
								vim.fn.mkdir(parent, "p")
								vim.uv.fs_symlink(target, link)
							end
						end
					end
				end,
			},
		},
	},
}
