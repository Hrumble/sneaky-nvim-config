return {
	{
		"eandrju/cellular-automaton.nvim",
		event = "VeryLazy",
	},
	-- A fun RPG stat tracker
	{
		"gisketch/triforce.nvim",
		dependencies = { "nvzone/volt" },
		config = function()
			require("triforce").setup({
				-- Optional: Add your configuration here
				keymap = {
					show_profile = "<leader>tp", -- Open profile with <leader>tp
				},
			})
		end,
	},
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		--   -- refer to `:h file-pattern` for more examples
		--   "BufReadPre path/to/my-vault/*.md",
		--   "BufNewFile path/to/my-vault/*.md",
		-- },
		---@module 'obsidian'
		---@type obsidian.config
		opts = {
			legacy_commands = false, -- this will be removed in the next major release
			workspaces = {
				{
					name = "Everywhere-Everything",
					path = "C:/Users/nolan/Documents/obsidian/Everywhere-Everything",
				},
				{
					name = "work",
					path = "~/vaults/work",
				},
			},
		},
	},
}
