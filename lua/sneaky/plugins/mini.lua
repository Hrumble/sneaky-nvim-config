return {
	{
		'nvim-mini/mini.files',
		config = function()

      local MiniFiles = require("mini.files")

      local show_gd_files = false
      local filter_show = function(fs_entry) return true end

      local filter_hide = function(fs_entry)
        return not (vim.endswith(fs_entry.name, '.import') or vim.endswith(fs_entry.name, '.uid'))
      end

      local toggle_gd_files = function()
        show_gd_files = not show_gd_files
        local new_filter = show_gd_files and filter_show or filter_hide
        MiniFiles.refresh({content = {filter = new_filter}})
      end

      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesBufferCreate',
        callback = function(args)
          local buf_id = args.data.buf_id
          vim.keymap.set('n', 'g.', toggle_gd_files, {buffer = buf_id})
        end,
      })

      MiniFiles.setup({
        windows = {
          preview = true,
          width_preview = 100
        },
        content = {
          filter = filter_hide
        }
      })
    end
  },
  {
    'nvim-mini/mini.notify',
    config = function()
      require("mini.notify").setup({
        lsp_progress = {
          enable = false
        },
      })
    end
  }
}
