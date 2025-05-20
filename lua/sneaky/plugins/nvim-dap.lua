return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"jay-babu/mason-nvim-dap.nvim",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		vim.fn.sign_define("DapBreakpoint", { text = "❤️", texthl = "", linehl = "", numhl = "" })

		-- Setup mason-dap
		local mason_dap = require("mason-nvim-dap")
		mason_dap.setup({
			ensure_installed = { "dart", "codelldb" },
			automatic_installation = true,
			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,
			},
		})

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

		-- Optional keymap to toggle DAP UI
		vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })

		-- Define Dart & Flutter adapters
		local mason_bin_path = vim.fn.stdpath("data") .. "/mason/bin/"
		local dart_adapter = vim.fn.has("win32") == 1
				and mason_bin_path .. "dart-debug-adapter.cmd"
				or mason_bin_path .. "dart-debug-adapter"

		dap.adapters = {
			dart = {
				type = "executable",
				command = dart_adapter,
				args = { "dart" },
			},
			flutter = {
				type = "executable",
				command = dart_adapter,
				args = { "flutter" },
			},
		}

		dap.configurations = {
			dart = {
				{
					type = "dart",
					request = "launch",
					name = "Launch Dart",
					program = "${workspaceFolder}/lib/main.dart",
					cwd = "${workspaceFolder}",
				},
			},
			flutter = {
				{
					type = "flutter",
					request = "launch",
					name = "Launch Flutter",
					program = "${workspaceFolder}/lib/main.dart",
					cwd = "${workspaceFolder}",
				},
			},
		}
	end,
}
