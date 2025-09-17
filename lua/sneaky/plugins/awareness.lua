-- Helps with code awareness i.e. Knowing where the fuck I am and what is going on in a file
return {
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require('treesitter-context').setup({

			})
		end
	},
	{
		'stevearc/aerial.nvim',
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			require("aerial").setup({})
		end
	}
}
