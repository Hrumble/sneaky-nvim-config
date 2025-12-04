return {
	{
		'nvim-mini/mini.files',
		config = function()
			require("mini.files").setup({
				windows = {
					preview = true,
					width_preview = 100
				}
			})
		end
	},
	{
		'nvim-mini/mini.notify',
		config = function()
			require("mini.notify").setup({})
		end
	}
}
