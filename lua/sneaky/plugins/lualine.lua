return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			extensions = { "neo-tree", "toggleterm", "trouble" },
			options = {
				disabled_filetypes = {},
			},
		})
	end,
}
