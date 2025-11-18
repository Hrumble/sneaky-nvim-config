local M = {}

function M.open_input()
	local buf = vim.api.nvim_create_buf(false, true)

	local width = math.floor(vim.o.columns * 0.5)
	local height = math.floor(vim.o.lines * 0.5)

	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	local win = vim.api.nvim_open_win(buf, true, {
		relative = 'win',
		row = row,
		col = col,
		width = width,
		height = height,
		border='rounded',
	})

	-- Set a prompt-like first line
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "Enter TODO:" })
	vim.api.nvim_win_set_cursor(win, { 1, 0 })


	-- Map <CR> inside the buffer to capture input
	vim.keymap.set("n", "<CR>", function()
	local lines = vim.api.nvim_buf_get_lines(buf, 1, 2, false)
	local todo = lines[1] or ""


	-- Close the floating window
	vim.api.nvim_win_close(win, true)


	-- Do something with the TODO (placeholder)
	vim.notify("TODO added: " .. todo)
	end, { buffer = buf })

end

M.open_input()
