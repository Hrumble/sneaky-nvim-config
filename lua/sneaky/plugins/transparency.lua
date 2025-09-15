return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	config = function()
		require("transparent").setup({
			groups = {
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLine",
				"CursorLineNr",
				"StatusLine",
				"StatusLineNC",
				"EndOfBuffer",
			},
			extra_groups = {
				-- Sets plugins to be transparent (specifies their highlight groups to have no bg color)
				-- Run :Telescope highlights to see all groups, or just :highlight
				"FloatBorder",
				"NeoTreeNormal",
				"NeoTreeNormalNC",
				"NormalFloat",
				-- Telescope highlight groups
				"TelescopeNormal",
				"TelescopeBorder",
				"TelescopePromptBorder",
				-- Blink groups
				"BlinkCmpMenuBorder",
				"BlinkCmdDocBorder",
				"BlinkCmpDoc",
				"LspInfoBorder",
				-- Trouble
				"TroubleNormal",

			},
		})
		vim.cmd("TransparentEnable")
	end,
}
