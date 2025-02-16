return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
					dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			vim.cmd("nnoremap ff <cmd>Telescope find_files<cr><Esc>")
			vim.cmd("nnoremap fg <cmd>Telescope live_grep<cr>")
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<A-h>"] = actions.select_horizontal,
							["<A-v>"] = actions.select_vertical
						},
						n = {
							["<A-h>"] = actions.select_horizontal,
							["<A-v>"] = actions.select_vertical

						}
					}
				}
			})
		end
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown{
						}
					}
				}
			})
			require("telescope").load_extension("ui-select")
		end
	}
}
