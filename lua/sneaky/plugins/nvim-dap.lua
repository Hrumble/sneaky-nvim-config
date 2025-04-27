return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })

		-- Sets up mason-dap to autoinstall debuggers
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

		-- configuration and adapters
		local dap = require("dap")
		local mason_bin_path = vim.fn.stdpath("data") .. "/mason/bin/"
		dap.adapters = {
			dart = {
				type = "executable",
				command = mason_bin_path .. "dart-debug-adapter.cmd",
				args = { "dart" },
			},
			flutter = {
				type = "executable",
				command = mason_bin_path .. "dart-debug-adapter.cmd",
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
				type = "flutter",
				request = "launch",
				name = "Launch Flutter",
				program = "${workspaceFolder}/lib/main.dart",
				cwd = "${workspaceFolder}",
			},
		}
	end,
}
