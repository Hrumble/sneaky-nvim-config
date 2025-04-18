return {
	'akinsho/toggleterm.nvim',
	version = '*',
	config = function()
		require('toggleterm').setup({
			direction = 'vertical',
			winbar = {
				enabled = false
			}
		})
	end
}
