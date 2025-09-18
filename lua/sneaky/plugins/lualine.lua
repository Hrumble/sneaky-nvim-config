local function get_attached_clients()
	-- Get active clients for current buffer
	local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
	if #buf_clients == 0 then
		return "No client active"
	end
	local buf_ft = vim.bo.filetype
	local buf_client_names = {}
	local num_client_names = #buf_client_names

	-- Add formatters (conform.nvim)
	local conform_success, conform = pcall(require, "conform")
	if conform_success then
		for _, formatter in pairs(conform.list_formatters_for_buffer(0)) do
			if formatter then
				num_client_names = num_client_names + 1
				buf_client_names[num_client_names] = formatter
			end
		end
	end

	local client_names_str = table.concat(buf_client_names, ", ")
	local language_servers = string.format("[%s]", client_names_str)

	return language_servers
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "mfussenegger/nvim-lint", "stevearc/conform.nvim" },
	config = function()
		local attached_clients = {
			get_attached_clients(),
			color = {
				gui = "bold",
			},
		}
		require("lualine").setup({
			extensions = { "neo-tree", "toggleterm", "trouble" },
			options = {
				disabled_filetypes = {},
				globalstatus = false,
			},
			sections = {
				lualine_x = {
					attached_clients,
				}
			}
		})
	end,
}
