-- nvim-grep-results-floating with full highlight snapshot (Option A) + live-grep syntax highlighting

local M = {}

-- setup table with defaults
local config = {
	context_before = 5,
	context_after = 5,
	context_width = 0.5,            -- fraction of screen width
	context_border = "rounded",
	context_highlight = "Visual",   -- matched line highlight
	float_width = 0.7,              -- fraction of screen width
	float_height = 0.6,             -- fraction of screen height
}

function M.setup(opts)
	if opts then
		for k, v in pairs(opts) do
			config[k] = v
		end
	end
end

-- namespaces
local clone_ns = vim.api.nvim_create_namespace("grep_float_clone")
local cursor_ns = vim.api.nvim_create_namespace("grep_float_cursor")


local function create_float()
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
	vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
	vim.api.nvim_buf_set_option(buf, 'modifiable', false)
	vim.api.nvim_buf_set_option(buf, 'buflisted', false)

	local width = math.floor(vim.o.columns * config["float_width"])
	local height = math.floor(vim.o.lines * config["float_height"])
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	local win = vim.api.nvim_open_win(buf, true, {
		relative = 'editor',
		width = width,
		height = height,
		row = row,
		col = col,
		style = 'minimal',
		border = 'rounded',
	})

	vim.api.nvim_win_set_option(win, 'cursorline', true)
	return buf, win
end

-- ...[clone_extmarks, attach_cursor_highlight, grep unchanged]...

-- LIVE GREP ADDITIONS WITH SYNTAX HIGHLIGHTING
function M.live_grep()
	local src_buf = vim.api.nvim_get_current_buf()
	local src_ft = vim.api.nvim_buf_get_option(src_buf, 'filetype')
	local all_lines = vim.api.nvim_buf_get_lines(src_buf, 0, -1, false)

	local float_buf, float_win = create_float()
	vim.api.nvim_buf_set_option(float_buf, "modifiable", true)
	-- set filetype same as source for syntax highlighting
	vim.api.nvim_buf_set_option(float_buf, 'filetype', src_ft)

	-- first line reserved for input
	vim.api.nvim_buf_set_lines(float_buf, 0, -1, false, { "" })
	vim.api.nvim_win_set_cursor(float_win, { 1, 0 })

	local ns_input = vim.api.nvim_create_namespace("grep_float_input_hl")

	local function update_results()
		local pattern = vim.api.nvim_buf_get_lines(float_buf, 0, 1, false)[1] or ""

		-- get old cursor pos to restore after update
		local cur = vim.api.nvim_win_get_cursor(float_win)

		-- clear old results, starting from line 1 (leave input line)
		vim.api.nvim_buf_set_option(float_buf, "modifiable", true)
		vim.api.nvim_buf_set_lines(float_buf, 1, -1, false, {})

		local out = {}
		for i, line in ipairs(all_lines) do
			if pattern ~= "" and line:match(pattern) then
				table.insert(out, i .. ": " .. line)
			end
		end

		vim.api.nvim_buf_set_lines(float_buf, 1, -1, false, out)
		-- keep input line modifiable
		vim.api.nvim_buf_set_option(float_buf, "modifiable", true)

		-- restore cursor so typing continues
		vim.api.nvim_win_set_cursor(float_win, cur)
	end

	vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
		buffer = float_buf,
		callback = update_results,
	})

	vim.keymap.set("n", "<CR>", function()
		local row = vim.api.nvim_win_get_cursor(float_win)[1]
		if row < 1 then return end
		local text = vim.api.nvim_buf_get_lines(float_buf, row - 1, row, false)[1]
		if not text then return end
		local num = tonumber(text:match("^(%d+):"))
		if not num then return end
		vim.api.nvim_win_close(float_win, true)
		vim.api.nvim_set_current_buf(src_buf)
		vim.api.nvim_win_set_cursor(0, { num, 0 })
	end, { buffer = float_buf })

	vim.keymap.set("n", "<Esc>", function()
		if vim.api.nvim_win_is_valid(float_win) then
			vim.api.nvim_win_close(float_win, true)
		end
	end, { buffer = float_buf })

	vim.keymap.set("n", "l", function()
		local row = vim.api.nvim_win_get_cursor(float_win)[1]
		if row < 1 then return end

		local text = vim.api.nvim_buf_get_lines(float_buf, row - 1, row, false)[1] or ""
		local orig_num = tonumber(text:match("^(%d+):"))
		if not orig_num then return end

		local src_lines = vim.api.nvim_buf_get_lines(src_buf, 0, -1, false)
		local start_line = math.max(orig_num - config.context_before - 1, 0)
		local end_line = math.min(orig_num + config.context_after, #src_lines)

		local lines = {}
		for i = start_line + 1, end_line do
			table.insert(lines, src_lines[i])
		end

		local buf = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
		vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
		vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
		vim.api.nvim_buf_set_option(buf, 'modifiable', false)
		vim.api.nvim_buf_set_option(buf, 'filetype', vim.api.nvim_buf_get_option(src_buf, 'filetype'))

		local width = math.floor(vim.o.columns * config.context_width)
		local height = #lines
		local row_win = math.floor((vim.o.lines - height) / 2)
		local col_win = math.floor((vim.o.columns - width) / 2)

		local win = vim.api.nvim_open_win(buf, true, {
			relative = "editor",
			width = width,
			height = height,
			row = row_win,
			col = col_win,
			style = "minimal",
			border = config.context_border,
		})

		-- place cursor on the matched line
		local cursor_line = orig_num - start_line
		if cursor_line < 1 then cursor_line = 1 end
		vim.api.nvim_win_set_cursor(win, { cursor_line, 0 })

		-- highlight the matched line
		local ns = vim.api.nvim_create_namespace("grep_context_highlight")
		vim.api.nvim_buf_add_highlight(buf, ns, config.context_highlight, cursor_line - 1, 0, -1)

		-- close context window on <Esc> or q
		local close_fn = function()
			if vim.api.nvim_win_is_valid(win) then
				vim.api.nvim_win_close(win, true)
			end
		end
		vim.keymap.set("n", "<Esc>", close_fn, { buffer = buf, noremap = true, silent = true })
		vim.keymap.set("n", "q", close_fn, { buffer = buf, noremap = true, silent = true })
	end, { buffer = float_buf })
end

return M
