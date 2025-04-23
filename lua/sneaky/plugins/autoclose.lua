return {
	"m4xshen/autoclose.nvim",
	config = function()
		require("autoclose").setup({
			keys = {
				["<"] = { pair = "<>", escape = true, close = true },
			},
			options = {
				disabled_filetypes = { "text", "markdown" },
				escape = true,
				disable_command_mode = true,
				disable_when_touch = true,
				touch_regex = "[%w(%[{]",
			},
		})
	end,
}
