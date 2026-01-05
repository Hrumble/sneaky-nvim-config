return {
	{
		"eandrju/cellular-automaton.nvim",
		event = "VeryLazy",
	},
	-- A fun RPG stat tracker
	{
		"gisketch/triforce.nvim",
		dependencies = { "nvzone/volt" },
		event = "VeryLazy",
		config = function()
			require("triforce").setup({
				-- Optional: Add your configuration here
				keymap = {
					show_profile = "<leader>tp", -- Open profile with <leader>tp
				},
			})
		end,
	},
}
