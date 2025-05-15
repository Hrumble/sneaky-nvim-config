return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		-- Mason is a lsp package manager, it does nothing but install and manage them for you
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pylsp",
					"rust_analyzer",
					"ast_grep",
					"html",
					"emmet_language_server",
					"cssls",
					"omnisharp",
				}, -- Specify lsp that you want to make sure are installed here, those are lsp that mason has, and not just any.
			})
		end,
	},
	{
		-- nvim-lspconfig is the thing that actually sets up and uses the lsp.
		-- run :LspInfo to get the currently attached lsp, and additional info
		"neovim/nvim-lspconfig",
		-- example using `opts` for defining servers
		opts = {
			-- set up each lsp here, you can specify filetypes, and other options.
			servers = {
				gdscript = {
					root_dir = vim.fs.dirname(vim.fs.find({ "project.godot", ".git" }, { upward = true })[1]),
				},
				omnisharp = {},
				cssls = {},
				ts_ls = {},
				html = {
					filetypes = { "html", "php", "typescriptreact", "javascriptreact" },
				},
				emmet_language_server = {
					filetypes = { "html", "typescriptreact", "javascriptreact" },
				},
				lua_ls = {
					on_attach = on_attach,
					flags = lsp_flags,
					settings = {
						Lua = {
							runtime = {
								-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
								version = "LuaJIT",
							},
							diagnostics = {
								-- Get the language server to recognize the `vim` global
								globals = { "vim" },
							},
							workspace = {
								-- Make the server aware of Neovim runtime files
								library = vim.api.nvim_get_runtime_file("", true),
							},
							-- Do not send telemetry data containing a randomized but unique identifier
							telemetry = {
								enable = false,
							},
						},
					},
				},
				pylsp = {},
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							diagnostics = {
								enable = false,
							},
						},
					},
				},
				ast_grep = {},
				dartls = {
					onlyAnalyzeProjectsWithOpenFiles = false,
				},
			},
		},
		-- No idea what this does but don't touch it.
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end,
	},
}
