return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "mfussenegger/nvim-lint", "stevearc/conform.nvim" },
	config = function()
		require("lualine").setup({
			extensions = { "neo-tree", "toggleterm", "trouble" },
			options = {
				disabled_filetypes = {},
				globalstatus = true,
			},
			sections = {
				lualine_a = {'mode'},
				lualine_b = {'branch', 'diff', 'diagnostics'},
				lualine_c = {'filename', 'lsp_status'},

        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'searchcount'},
        lualine_z = {'location'}
			},
			tabline = {}
		})
	end,
}
