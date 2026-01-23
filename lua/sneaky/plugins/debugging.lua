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
		vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {desc = "toggles a debugging breakpoint"})
		vim.keymap.set("n", "<Leader>dn", dap.continue, {desc = "Next debugging step"})

    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = {"--interpreter=dap", "--eval-command", "set print pretty on"}
    }
		-- Python debug adapter (requires debugpy)
		dap.adapters.python = function(cb, config)
			if config.request == 'attach' then
				---@diagnostic disable-next-line: undefined-field
				local port = (config.connect or config).port
				---@diagnostic disable-next-line: undefined-field
				local host = (config.connect or config).host or '127.0.0.1'
				cb({
					type = 'server',
					port = assert(port, '`connect.port` is required for a python `attach` configuration'),
					host = host,
					options = {
						source_filetype = 'python',
					},
				})
			else
				cb({
					type = 'executable',
					command = "python",
					args = { '-m', 'debugpy.adapter' },
					options = {
						source_filetype = 'python',
					},
				})
			end
		end
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
		dap.configurations.python = {
			{
				-- The first three options are required by nvim-dap
				type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
				request = 'launch';
				name = "Launch file";

				-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

				program = "${file}"; -- This configuration will launch the current file if used.
				pythonPath = function()
					-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
					-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
					-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
						local cwd = vim.fn.getcwd()
						if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
							return cwd .. '/venv/bin/python'
						elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
							return cwd .. '/.venv/bin/python'
						else
							return 'python'
						end
					end,
			},
		}

		-- Dart debug adapter + flutter
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
		dap.adapters.dart = {
			type = 'executable',
			command = 'dart',    -- if you're using fvm, you'll need to provide the full path to dart (dart.exe for windows users), or you could prepend the fvm command
			args = { 'debug_adapter' },
			-- windows users will need to set 'detached' to false
			options = {
				detached = false,
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
