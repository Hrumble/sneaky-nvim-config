local M = {}

-- Sets the cwd to wherever `root_file` is located
-- checks from file path upwards
function M.change_to_root(root_file)
	local project_file = vim.fn.findfile(root_file, ".;/")
	local project_path = vim.fn.fnamemodify(project_file, ":p:h")
	vim.cmd('cd ' .. project_path)
end

return M
