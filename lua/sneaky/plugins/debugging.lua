  return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    -- set up when dapui opens and closes
    dap.listeners.before.attach.dapui_config = function ()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function ()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function ()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function ()
      dapui.close()
    end

    -- keymaps
    vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "toggles a debugging breakpoint" })
    vim.keymap.set("n", "<Up>", dap.restart_frame, { desc = "DAP restart frame" })
    vim.keymap.set("n", "<Down>", dap.step_over, { desc = "DAP step over" })
    vim.keymap.set("n", "<Left>", dap.step_out, { desc = "DAP step out" })
    vim.keymap.set("n", "<Right>", dap.step_into, { desc = "DAP step into" })

  ----------------------------------------------------------------------
  --                             Adapters                             --
  ----------------------------------------------------------------------

    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = {"--interpreter=dap", "--eval-command", "set print pretty on"}
    }

    dap.adapters.dart = {
      type = 'executable',
      command = 'dart',    -- if you're using fvm, you'll need to provide the full path to dart (dart.exe for windows users), or you could prepend the fvm command
      args = { 'debug_adapter' },
      -- windows users will need to set 'detached' to false
      options = {
        detached = false,
      }
    }

  ----------------------------------------------------------------------
  --                          Configurations                          --
  ----------------------------------------------------------------------

    dap.configurations.c = {
      {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        args = {}, -- provide arguments if needed
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
      },
      {
        name = "Select and attach to process",
        type = "gdb",
        request = "attach",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        pid = function()
          local name = vim.fn.input('Executable name (filter): ')
          return require("dap.utils").pick_process({ filter = name })
        end,
        cwd = '${workspaceFolder}'
      },
      {
        name = 'Attach to gdbserver :1234',
        type = 'gdb',
        request = 'attach',
        target = 'localhost:1234',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}'
      }
    }
    dap.configurations.dart = {
      {
        type = "dart",
        request = "launch",
        name = "Launch dart",
        dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/bin/dart", -- ensure this is correct
        flutterSdkPath = "/opt/flutter/bin/flutter",                  -- ensure this is correct
        program = "${workspaceFolder}/lib/main.dart",     -- ensure this is correct
        cwd = "${workspaceFolder}",
      },
      {
        type = "flutter",
        request = "launch",
        name = "Launch flutter",
        dartSdkPath = "/opt/flutter/bin/cache/dart-sdk/bin/dart", -- ensure this is correct
        flutterSdkPath = "/opt/flutter/bin/flutter",             -- ensure this is correct
        program = "${workspaceFolder}/lib/main.dart",     -- ensure this is correct
        cwd = "${workspaceFolder}",
      }
    }
    dap.adapters.flutter = {
      type = 'executable',
      command = 'flutter',   -- if you're using fvm, you'll need to provide the full path to flutter (flutter.bat for windows users), or you could prepend the fvm command
      args = { 'debug_adapter' },
      -- windows users will need to set 'detached' to false
      options = {
        detached = false,
      }
    }
  end,
  }
