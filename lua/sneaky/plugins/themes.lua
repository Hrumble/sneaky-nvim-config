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
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				transparent = false,
			})
		end,
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
	}
}
