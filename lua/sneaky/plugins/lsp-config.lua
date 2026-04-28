return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mattn/emmet-vim",
    config = function()
      vim.g.user_emmet_mode = "n"
      vim.g.emmet_disable_autoclose_tag = 1
    end,
  },
  {
    -- Mason is a lsp package manager, it does nothing but install and manage them for you
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "basedpyright",
          "rust_analyzer",
          -- C
          "clangd",
          -- C#
          "omnisharp",

          -- web
          "html",
          "ts_ls",
          "emmet_language_server",
          "cssls",
          "tailwindcss",
        }, -- Specify lsp that you want to make sure are installed here, those are lsp that mason has, and not just any.
        automatic_enable = false,
        automatic_setup = false,
      })
    end,
  },
  {
    -- nvim-lspconfig is the thing that actually sets up and uses the lsp.
    -- run :LspInfo to get the currently attached lsp, and additional info
    "neovim/nvim-lspconfig",
    -- example using `opts` for defining servers
    opts = {
      -- set up each lsp here, you can specify filetypes, and other options.
      servers = {
        -- WEB
        emmet_language_server = {
          filetypes = { "html" }
        },
        tailwindcss = {},
        cssls = {
          filetypes = { "css", "scss", "less" },
        },
        ts_ls = {
          filetypes = { "typescriptreact", "typescript" }, -- or use "tsserver" for default name
        },

        jdtls = {
          cmd = { "jdtls" },
          filetypes = { "java" }, -- Correct position for filetypes outside the java settings
        },
        -- GODOT
        gdscript = {
          filetypes = { "gdscript" },
          root_dir = vim.fs.dirname(vim.fs.find({ "project.godot", ".git" }, { upward = true })[1]),
          cmd = vim.lsp.rpc.connect("127.0.0.1", 6005)
        },
        gdshader_lsp = { -- https://github.com/GodOfAvacyn/gdshader-lsp
          -- build from source and add to path
          filetypes = { "gdshader" },
          cmd = { "gdshader-lsp" },
        },

        wgsl_analyzer = {
          cmd = { vim.fn.expand("$HOME") .. "/.cargo/bin/wgsl-analyzer" },
          filetypes = { "wgsl" },
          settings = {},
        },
        omnisharp = {
          filetypes = { "cs", "vb" },
        },
        lua_ls = {
          filetypes = { "lua" },
          on_attach = on_attach,
          flags = lsp_flags,
          -- lot of boilerplate to let me get vim cmp when coding here
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },
        basedpyright = {
          filetypes = { "python" },
          settings = {
            basedpyright = {
              typeCheckingMode = "basic",
              -- analysis = {
              --   diagnosticSeverityOverrides = {
              --     -- Core correctness (keep these)
              --     reportGeneralTypeIssues = "error",
              --     reportUndefinedVariable = "error",
              --     reportUnboundVariable = "error",
              --     reportPossiblyUnboundVariable = "warning",
              --     -- reportAssignmentType = "error",
              --     reportReturnType = "error",
              --     -- reportArgumentType = "error",
              --     reportCallIssue = "error",
              --     -- reportIndexIssue = "error",
              --     -- reportOperatorIssue = "error",
              --
              --     -- Optional safety (keep, but slightly softer)
              --     reportOptionalMemberAccess = "warning",
              --     reportOptionalSubscript = "warning",
              --     reportOptionalCall = "warning",
              --
              --     -- Imports (keep visible but not blocking)
              --     reportMissingImports = "error",
              --
              --     -- Code quality noise (usually disable)
              --     reportUnusedImport = "warning",
              --     reportUnusedVariable = "warning",
              --     reportDuplicateImport = "warning",
              --
              --     reportUnusedExpression = "warning",
              --     reportUnusedCallResult = "warning",
              --
              --     -- Safety edge cases
              --     reportUninitializedInstanceVariable = "warning",
              --   },
              -- },
            }
          },
        },
        rust_analyzer = {
          filetypes = { "rust" },
          settings = {
            ["rust-analyzer"] = {
              diagnostics = {
                enable = false,
              },
              cargo = {
                loadOutDirsFromCheck = true,
              },
              procMacro = {
                enable = true,
              },
              files = {
                excludeDirs = { "target", ".git", "node_modules" },
              },
            },
          },
        },
      },
    },
    -- No idea what this does but don't touch it.
    config = function(_, opts)
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)

        vim.lsp.config[server] = config
        vim.lsp.enable(server)
        -- lspconfig[server].setup(config)
      end
    end,
  },
}
