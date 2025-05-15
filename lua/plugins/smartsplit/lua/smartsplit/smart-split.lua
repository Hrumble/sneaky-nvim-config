local M = {}

M.config = {
	excluded_buftypes = {
		"nofile",
		"terminal"
	}
}

local ratio = vim.api.nvim_win_get_width(0) / vim.api.nvim_win_get_height(0)

-- Function to update the config from user
function M.setup(user_config)
	M.config = vim.tbl_extend("force", M.config, user_config or {})
end

function M.get_smart_dir(win)
	local height = vim.api.nvim_win_get_height(win) *  ratio
	local width = vim.api.nvim_win_get_width(win)

	local split_dir = "vsplit"

	if height > width then
		split_dir = "split"
	end

	return split_dir
end

function M.smart_split()
	local max_area = 0
	local target_win = 0

	for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.tbl_contains(M.config.excluded_buftypes, vim.bo[buf].buftype) then
			goto continue
		end
		local height = vim.api.nvim_win_get_height(win)
		local width = vim.api.nvim_win_get_width(win)
		local size = height * width

		if size > max_area then
			max_area = size
			target_win = win
		end
		::continue::
	end
	local split_dir = M.get_smart_dir(target_win)
	vim.api.nvim_set_current_win(target_win)
	vim.cmd(split_dir)
	vim.cmd("wincmd=")
end

vim.api.nvim_create_user_command("SmartSplit", function()
	require("smartsplit.smart-split").smart_split()
end, {})

return M
