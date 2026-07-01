return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ":TSUpdate",
    config = function()
      -- On Windows: needs clang from msys2 (...\msys2\mingw64\bin on PATH)
      -- gcc doesn't work for some parsers; clang does.
      if vim.fn.has('win32') == 1 then
        require("nvim-treesitter.install").compilers = { 'clang' }
      end

      require("nvim-treesitter.config").setup({
        ensure_installed = {
          "lua",
          "html",
          "css",
          "php",
          "python",
          "dart",
          "javascript",
          "typescript",
          "wgsl",
          "gdscript",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({})
    end,
  },
}
