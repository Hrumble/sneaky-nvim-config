return {
	dir = vim.fn.stdpath("config") .. "/lua/plugins/smartsplit",
	config = function()
		require("smartsplit.smart-split").setup({
			min_width = 60,
			min_height = 30,
		})
	end
}
