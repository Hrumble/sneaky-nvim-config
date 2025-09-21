return {
	"akinsho/flutter-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		vim.api.nvim_create_user_command("DevLogFloat", function()
			vim.api.nvim_open_win(vim.api.nvim_create_buf(false, true), true, {
				relative = 'editor',
				width = 80,
				height = 20,
				row = 5,
				col = 10,
				style = 'minimal',
				border = 'rounded',
			})
		end, {})

		require('flutter-tools').setup {
			-- (uncomment below line for windows only)
			-- flutter_path = "home/flutter/bin/flutter.bat",

			debugger = {
				-- Make these two params true to enable debug mode
				enabled = false,
				run_via_dap = false,
				register_configurations = function(_)
					require("dap").adapters.dart = {
						type = "executable",
						command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
						args = { "flutter" }
					}

					require("dap").configurations.dart = {
						{
							type = "dart",
							request = "launch",
							name = "Launch flutter",
							dartSdkPath = 'home/flutter/bin/cache/dart-sdk/',
							flutterSdkPath = "home/flutter",
							program = "${workspaceFolder}/lib/main.dart",
							cwd = "${workspaceFolder}",
						}
					}
					-- uncomment below line if you've launch.json file already in your vscode setup
					-- require("dap.ext.vscode").load_launchjs()
				end,
			},
			dev_log = {
				-- toggle it when you run without DAP
				enabled = true,
				open_cmd = "bo 15sp"
			},
			lsp = {
				capabilities = capabilities,
			},

		}
	end
}
