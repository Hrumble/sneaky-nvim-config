local keymap = vim.keymap
-- Sets leader key
keymap.set({ "n", "v" }, "<Space>", "<Nop>")
vim.g.mapleader = " "

-- General Mappings
keymap.set("i", "jj", "<Esc>")
-- Sets split screen movement to use Alt
keymap.set({ "n", "t" }, "<A-j>", "<C-w>j")
keymap.set({ "n", "t" }, "<A-k>", "<C-w>k")
keymap.set({ "n", "t" }, "<A-h>", "<C-w>h")
keymap.set({ "n", "t" }, "<A-l>", "<C-w>l")

-- maps code actions
keymap.set("n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", { noremap = true, silent = true })

-- maps to reload nvim conf
keymap.set("n", "<Leader>nrr", "<cmd>source<cr>")

-- QOL mappings
keymap.set("n", "<S-k>", function()
	vim.lsp.buf.hover({
		border = "rounded",
	})
end, { noremap = true }) -- Remaps <S-k> to give rounded borders

keymap.set("n", "<S-e>", function()
	vim.diagnostic.open_float({
		border = "rounded",
	})
end, { noremap = true }) -- Maps <S-e> to open hover diagnostic window with border
keymap.set("n", "<Leader>rn", function()
	vim.lsp.buf.rename()
end, { desc = "renames a function or variable in the entire project" }) -- renames a function or variable in the entire project
keymap.set("n", "<S-u>", "<cmd>redo<cr>", { desc = "shift-u to redo undo" }) -- shift-u to redo undo
-- Aerial
keymap.set("n", "<Leader>a", "<cmd>AerialToggle<cr>", { desc = "Toggles the aerial window" })
keymap.set("n", "}", function()
	local aerial = require("aerial")
	if aerial.is_open then
		aerial.next()
	end
end, { desc = "Aerial next function" })
keymap.set("n", "{", function()
	local aerial = require("aerial")
	if aerial.is_open then
		aerial.prev()
	end
end, { desc = "Aerial next function" })
-- Telescope
keymap.set(
	"n",
	"<Leader>ft",
	"<cmd>Telescope colorscheme<cr>",
	{ desc = "browse available colorschemes with telescope" }
) -- browse available colorschemes with telescope
keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", { desc = "browse files with telescope" }) -- browse files with telescope
keymap.set("n", "<Leader>fc", "<cmd>Telescope commands<cr>", {
	desc = "Opens a list of all available commands to the user",
}) -- Opens a list of all available commands to the user
keymap.set("n", "<Leader>fb", function() -- Opens a list of all available commands to the user
	require("telescope.builtin").buffers({
		sort_mru = true,
		show_all_buffers = false,
		ignore_current_buffer = true,
	})
end)
keymap.set(
	"n",
	"<Leader>fs",
	"<cmd>Telescope lsp_document_symbols<cr>",
	{ desc = "browse current file definitions with telescope" }
) -- browse current file definitions with telescope
keymap.set("n", "<Leader>fr", "<cmd>Telescope lsp_references<cr>", { desc = "goes to class or variable definition" }) -- goes to class or variable definition
keymap.set("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "live grep" }) -- live grep
keymap.set("n", "|", "<cmd>Neotree toggle left<cr>", { desc = "Toggles neotree" }) -- Toggles neotree
keymap.set("n", "<Bslash>", "<cmd>Neotree toggle left reveal<cr>", { desc = "Toggles neotree on the current file" }) -- Toggles neotree
keymap.set(
	"n",
	"<Leader>gd",
	"<cmd>Telescope lsp_definitions<cr>",
	{ desc = "goes to class or variable definition of word under cursor" }
) -- goes to class or variable definition of word under cursor
keymap.set(
	"n",
	"<Leader>gtd",
	"<cmd>Telescope lsp_type_definitions<cr>",
	{ desc = "goes to the definition of the *TYPE* of the word under cursor" }
) -- goes to the definition of the *TYPE* of the word under cursor
keymap.set("n", "<Leader>zz", "<cmd>ZenMode<cr>", { desc = "toggles focus mode for current window" }) -- toggles focus mode for current window
keymap.set("n", "<Leader><Tab>", "<cmd>b#<cr>", { desc = "Switches to previous opened buffer" }) -- Switches to previous opened buffer

-- nvim dap (debugging)
keymap.set("n", "<Leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "toggles breakpoint on current line" }) -- toggles breakpoint on current line
keymap.set("n", "<Leader>dca", "<cmd>DapClearBreakpoints<cr>", { desc = "clears all breakpoints" }) -- clears all breakpoints
keymap.set("n", "<F5>", "<cmd>DapContinue<cr>", { desc = "moves to the next breakpoint while running" }) -- moves to the next breakpoint while running
keymap.set("n", "<Leader>dt", "<cmd>DapToggleRepl<cr>")
keymap.set("n", "<C-F5>", "<cmd>DapNew<cr>")

-- Trouble
keymap.set("n", "<Leader>xx", "<cmd>Trouble diagnostics toggle focus=true<cr>") -- Opens trouble
keymap.set("n", "<Leader>xc", "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>") -- Opens trouble for current buffer only

-- LazyGit
keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- Term keymaps
vim.keymap.set({ "t", "n" }, "<A-t>", "<cmd>ToggleTermToggleAll<cr>") -- Opens or closes all available or opened terminals
vim.keymap.set({ "t", "n" }, "<A-1>", "<cmd>1ToggleTerm direction=horizontal size=15 name=1<cr>")
vim.keymap.set({ "t", "n" }, "<A-2>", "<cmd>2ToggleTerm direction=horizontal size=15 name=2<cr>")
vim.keymap.set({ "t", "n" }, "<A-3>", "<cmd>3ToggleTerm direction=horizontal size=15 name=3<cr>")
vim.keymap.set({ "t", "n" }, "<A-4>", "<cmd>4ToggleTerm direction=horizontal size=15 name=4<cr>")
vim.keymap.set({ "t", "n" }, "<A-5>", "<cmd>5ToggleTerm direction=horizontal size=15 name=5<cr>")
vim.keymap.set({ "t", "n" }, "<A-6>", "<cmd>6ToggleTerm direction=horizontal size=15 name=6<cr>")
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts) -- Marks <esc> to leave insert mode inside terminal

-- Sets y to copy to clipboard
vim.cmd("set clipboard=unnamedplus")
