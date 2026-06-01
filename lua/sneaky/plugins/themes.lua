return {
	-- Only kanagawa is loaded eagerly (it's the active theme).
	-- Others are lazy so they don't cost startup time; switch with :colorscheme <name>
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none"
							}
						}
					}
				},
				overrides = function(colors)
					return {
						Function = { bold = true },
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" }
					}
				end
			})
		end
	},
	{ "folke/tokyonight.nvim", lazy = true },
	{ "morhetz/gruvbox",       lazy = true },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		config = function()
			require('catppuccin').setup({
				transparent_background = true,
			})
		end
	},
	{ "nyoom-engineering/oxocarbon.nvim", lazy = true },
}
