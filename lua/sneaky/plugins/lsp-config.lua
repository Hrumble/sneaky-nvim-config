return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {"lua_ls", "pylsp", "rust_analyzer", "ast_grep"}
			})
		end
	},
	{
		'neovim/nvim-lspconfig',
		-- example using `opts` for defining servers
		opts = {
			servers = {
				lua_ls = {},
				pylsp = {},
				rust_analyzer = {},
				ast_grep = {},
				dartls = {},
			}
		},
		config = function(_, opts)
			local lspconfig = require('lspconfig')
			for server, config in pairs(opts.servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end
	}
}

