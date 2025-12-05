return {
	-- Autopair closing and opening
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = function()
			require('nvim-autopairs').setup({
				disable_filetype = { "markdown", "text" }
			})
		end
	},
	-- Code formatter
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					css = { "prettier" },
					json = { "prettier" },
					markdown = { "prettier" },
					graphql = { "prettier" },
					lua = { "stylua" },
					python = { "isort", "black" },
					gdscript = { "gdformat" },
					dart = {},
				},
			})
			vim.keymap.set({ "n", "v" }, "<S-A-f>", function()
				conform.format({
					lsp_format = "fallback",
					async = true,
					timeout_ms = 500,
				})
			end, { desc = "Format file or range (in visual mode)" })
		end,
	},
	-- LSP Diagnostics
	{
		'folke/trouble.nvim',
		config = function()
			require('trouble').setup({})
		end
	},
	{
		"folke/twilight.nvim",
		opts = {
			dimming = {
				inactive = true,
			},
			context = 1,
			expand = {
				"function"
			}
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
	-- Nice tab manager, ACTUAL TABS NOT FUCKING BUFFERS
	{
		'nanozuki/tabby.nvim',
		config = function()
			require('tabby').setup({})
		end
	},
	-- Nicer TS based folds
	{
		'chrisgrieser/nvim-origami',
		event = "VeryLazy",
		opts = {},

		config = function()
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99

			require("origami").setup({
				foldKeymaps = {
					setup = false
				},
				autoFold = {
					enabled = true,
					kinds = { "comment", "imports" }
				}
			})
		end
	},
	-- Comments on code
	{
		"jameswolensky/marker-groups.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",       -- Required
			"nvim-telescope/telescope.nvim", -- Optional: Telescope picker
			-- mini.pick is part of mini.nvim; this plugin vendors mini.nvim for tests,
			-- but you can also install mini.nvim explicitly to use mini.pick system-wide
			-- "nvim-mini/mini.nvim",
		},
		config = function()
			require("marker-groups").setup({
				-- Default picker is 'vim' (built-in vim.ui)
				-- Accepted values: 'vim' | 'snacks' | 'fzf-lua' | 'mini.pick' | 'telescope'
				picker = 'telescope',
			})
		end,
	},
	{
		's1n7ax/nvim-comment-frame',
		dependencies = {
			"nvim-treesitter/nvim-treesitter"
		},
		config = function()
			require("nvim-comment-frame").setup({})
		end
	}
}
