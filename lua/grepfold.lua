local M = {}

local folded_lines = {}

local function grep_lines(pattern)
	local buf = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

	local matches = {}
	for i, line in ipairs(lines) do
		if line:match(pattern) then
			table.insert(matches, { line_number = i, text = line })
		end
	end
	return matches
end

function M.GrepFold(pattern)
	local matches = grep_lines(pattern)
	local last_line = 0
	for _, match in ipairs(matches) do
		local line_number = match.line_number
		if not last_line == line_number then
			vim.cmd(last_line .. "," .. line_number - 1 .. "fo")
			table.insert(folded_lines, last_line)
		end
		last_line = line_number + 1
	end
end

function M.GrepUnfold()
	vim.cmd("silent! %:norm zd")
end

vim.api.nvim_create_user_command('GrepFold', function(opts)
	M.GrepFold(opts.args)
end, { nargs = 1 })

vim.api.nvim_create_user_command('GrepFoldUnfold', function(_)
	M.GrepUnfold()
end, { nargs = 0 })

return M
