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
				ensure_installed = { "lua_ls", "pylsp", "rust_analyzer", "ast_grep", "harper_ls", "html" }, -- Specify lsp that you want to make sure are installed here, those are lsp that mason has, and not just any.
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
				html = {
					filetypes = {'html', 'php'}
				},
				ts_ls = {},
				harper_ls = {},
				lua_ls = {},
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
				dartls = {},
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
