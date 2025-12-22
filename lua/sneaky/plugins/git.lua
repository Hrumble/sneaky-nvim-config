return {
	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup()
		end
	},
	{
		"NeogitOrg/neogit",
			lazy = true,
			dependencies = {
				"nvim-lua/plenary.nvim",         -- required
				"sindrets/diffview.nvim",        -- optional - Diff integration

				-- Only one of these is needed.
				"nvim-telescope/telescope.nvim", -- optional
			},
			cmd = "Neogit",
			keys = {
				{ "<leader>ng", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
			}
	},
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup({
				current_line_blame = true,
				current_line_blame_opts = {
					delay = 500,
				}
			})
		end
	}
}
