return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "Telescope colorscheme", "Telescope find_files", "Telescope live_grep" },
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			telescope.setup({
				defaults = {
					layout_stategy = "vertical",
					mappings = {
						i = {
							["<A-h>"] = actions.select_horizontal,
							["<A-v>"] = actions.select_vertical,
						},
						n = {
							["<A-h>"] = actions.select_horizontal,
							["<A-v>"] = actions.select_vertical,
						},
					},
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
