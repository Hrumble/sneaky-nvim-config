return {
	'akinsho/toggleterm.nvim',
	version = '*',
	config = function()
		require("toggleterm").setup({
			close_on_exit = true,
			open_mapping = [[<A-t>]],
			shell = vim.opt.shell:get(),
			direction = "float",
		})
	end
}
