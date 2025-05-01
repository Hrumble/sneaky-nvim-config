return {
	{
		'nvim-treesitter/nvim-treesitter',
		build= ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			local installs = require("nvim-treesitter.install")
			-- following line is real important and I struggled for a bit, on windows had to install msys2 which came with mingw64 used to run and compile c based shit
			-- turns out gcc wasn't cutting it for some reason, but clang did, so if you get errors with treesitter on windows, make sure to download msys2 and add it's .../mingw64/bin folder to path.
			-- pain in the ass windows bs
			if vim.fn.has('win32') == 1 then
			installs.compilers =  {'clang'}
			end

			configs.setup({
				ensure_installed = {"lua", "html", "css", "php", "python", "dart", "javascript", "typescript"},
				sync_intall = false,
				highlight = {enable = true, additional_vim_regex_highlighting = false},
				indent = {enable = true}
			})
		end
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
				require('nvim-ts-autotag').setup({
				opts = {
					-- Defaults
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false -- Auto close on trailing </
				},
			})
		end
	}
}
