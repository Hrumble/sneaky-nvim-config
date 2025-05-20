return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		require("flutter-tools").setup({
			debugger = {
				enabled = true,
				exception_breakpoints = {},
				register_configurations = function(_)
					require("dap").configurations.dart = {
						{
							name = "Flutter Chrome",
							type = "dart",
							request = "launch",
							program = "lib/main.dart",
							args = { "-d", "chrome" },
						},
						{
							name = "Flutter Edge",
							type = "dart",
							request = "launch",
							program = "lib/main.dart",
							args = { "-d", "edge" },
						},
						{
							name = "celos",
							request = "launch",
							type = "dart",
						},
						{
							name = "celos (profile mode)",
							request = "launch",
							type = "dart",
							flutterMode = "profile",
						},
						{
							name = "celos (release mode)",
							request = "launch",
							type = "dart",
							flutterMode = "release",
						},
						{
							name = "All Tests",
							type = "dart",
							request = "launch",
							program = "test/",
						},

					}
					local dap, dapui = require("dap"), require("dapui")
					dap.listeners.before.attach.dapui_config = function()
						dapui.open()
					end
					dap.listeners.before.launch.dapui_config = function()
						dapui.open()
					end
					dap.listeners.before.event_terminated.dapui_config = function()
						dapui.close()
					end
					dap.listeners.before.event_exited.dapui_config = function()
						dapui.close()
					end
				end,
			}
		})
	end,
}
