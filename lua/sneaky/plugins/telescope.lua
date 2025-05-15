return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "Telescope colorscheme", "Telescope find_files", "Telescope live_grep" },
		config = function()
			local telescope = require("telescope")
			local action_state = require("telescope.actions.state")

			local smart_split = function()
				local smart = require("smartsplit.smart-split")
				local selection = action_state.get_selected_entry()

				smart.smart_split()
				vim.cmd("edit " .. selection.path)

			end

			telescope.setup({
				defaults = {
					layout_stategy = "vertical",
					mappings = {
						i = {
							["<A-s>"] = smart_split,
						},
						n = {
							["<A-s>"] = smart_split,
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
