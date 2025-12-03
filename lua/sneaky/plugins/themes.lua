return {
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparency = true,
			})
		end,
	},
	{
		"morhetz/gruvbox",
		name = "gruvbox",
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require('catppuccin').setup({
				transparent_background = true,
				integrations = {
					cmp = true,
					treesitter = true,
					nvimtree = true,
				}
			})
		end
	},
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
					local theme = colors.theme
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
	{
		"nyoom-engineering/oxocarbon.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		'nyoom-engineering/nyoom.nvim',
		lazy = false,
		priority = 1000,
	},
	{
		'eldritch-theme/eldritch.nvim',
		lazy = false,
		priority = 1000,
	}
}
