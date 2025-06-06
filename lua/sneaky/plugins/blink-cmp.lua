return {
	"Saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = "rafamadriz/friendly-snippets",
	-- use a release tag to download pre-built binaries
	version = "*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		completion = {
			list = { selection = { preselect = false, auto_insert = false } },
			menu = {
				winblend = 0,
				min_width = 50,
				border = 'rounded',
				winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
				draw = {
					treesitter = { "lsp" },
				},
			},
			documentation = { auto_show = true, window = { border = "rounded" } },
		},

		signature = { window = { border = "rounded" } },
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- See the full "keymap" documentation for information on defining your own keymap.
		keymap = {
			preset = "default",
			["<Tab>"] = {
				function(cmp)
					if cmp.is_visible() then
						return cmp.select_next()
					end
				end,
				"fallback",
			},
			["<S-Tab>"] = {
				function(cmp)
					if cmp.is_visible() then
						return cmp.select_prev()
					end
				end,
				"fallback",
			},
			["<CR>"] = {
				function(cmp)
					if cmp.is_visible() then
						return cmp.accept()
					end
				end,
				"fallback",
			},
			-- ["<A-1>"] = {
			-- 	function(cmp)
			-- 		cmp.accept({ index = 1 })
			-- 	end,
			-- },
		},

		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			use_nvim_cmp_as_default = false,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},
		-- fuzzy = {
		-- 	implementation = "prefer_rust_with_warning",
		-- },
		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path" },
			providers = {
				cmdline = {
					-- ignores cmdline completions when executing shell commands
					enabled = function()
						return false
					end,
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
