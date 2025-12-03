return {
	{
		"otavioschwanck/arrow.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			-- or if using `mini.icons`
			-- { "echasnovski/mini.icons" },
		},
		opts = {
			show_icons = true,
			leader_key = '`',     -- Recommended to be a single key
			buffer_leader_key = 'm', -- Per Buffer Mappings

			-- These two hide the keymap menu
			hide_handbook = true,
			hide_buffer_handbook = true,
		}
	},
}
