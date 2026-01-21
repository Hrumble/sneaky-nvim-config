return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "Telescope colorscheme", "Telescope find_files", "Telescope live_grep" },
		config = function()
			local telescope = require("telescope")
			local action_state = require("telescope.actions.state")
			local actions = require("telescope.actions")

			local smart_split = function()
				local smart = require("smartsplit.smart-split")
				local selection = action_state.get_selected_entry()

				smart.smart_split()
				vim.cmd("edit " .. selection.path)
			end

			telescope.setup({
				defaults = {
					borderchars = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" },
					layout_stategy = "horizontal",
					mappings = {
						i = {
							["<A-h>"] = actions.select_horizontal,
							["<A-v>"] = actions.select_vertical,
						},
						n = {
							["<A-h>"] = actions.select_horizontal,
							["<A-v>"] = actions.select_vertical,
							["l"] = actions.add_selection,
							["h"] = actions.remove_selection,
							["c"] = actions.send_selected_to_qflist,
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
