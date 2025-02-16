return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = 'rafamadriz/friendly-snippets',

  -- use a release tag to download pre-built binaries
  version = '*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = { 
			preset = 'default',
			["<Tab>"] = {function(cmp) if cmp.is_visible() then return cmp.select_next() end end, 'fallback'},
      ["<CR>"] = {
        function(cmp)
          if cmp.is_visible() then
            return cmp.select_and_accept()
          end
        end,
        'fallback'
      },
			["<A-1>"] = {function(cmp) cmp.accept({ index = 1 }) end},
			["<A-2>"] = {function(cmp) cmp.accept({ index = 2 }) end},
			["<A-3>"] = {function(cmp) cmp.accept({ index = 3 }) end},
			["<A-4>"] = {function(cmp) cmp.accept({ index = 4 }) end},
			["<A-5>"] = {function(cmp) cmp.accept({ index = 5 }) end},
			["<A-6>"] = {function(cmp) cmp.accept({ index = 6 }) end},
			["<A-7>"] = {function(cmp) cmp.accept({ index = 7 }) end},
			["<A-8>"] = {function(cmp) cmp.accept({ index = 8 }) end},
			["<A-9>"] = {function(cmp) cmp.accept({ index = 9 }) end}
		},
	
    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },
    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
			providers = {
        cmdline = {
          -- ignores cmdline completions when executing shell commands
          enabled = function()
            return false
          end
        }
      }

    },
  },
  opts_extend = { "sources.default" }
}
