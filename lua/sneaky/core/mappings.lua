local keymap = vim.keymap
-- Sets leader key
keymap.set({ "n", "v" }, "<Space>", "<Nop>")
vim.g.mapleader = " "

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
keymap.set("n", "<S-u>", "<cmd>redo<cr>") -- shift-u to redo undo

keymap.set("n", "<Leader>ft", "<cmd>Telescope colorscheme<cr>") -- browse available colorschemes with telescope
keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>") -- browse files with telescope
keymap.set("n", "<Leader>fc", "<cmd>Telescope commands<cr>") -- Opens a list of all available commands to the user
keymap.set("n", "<Leader>fb", "<cmd>Telescope buffers<cr>") -- Opens a list of all available commands to the user
keymap.set("n", "<Leader>fs", "<cmd>Telescope lsp_document_symbols<cr>") -- browse current file definitions with telescope
keymap.set("n", "<Leader>fr", "<cmd>Telescope lsp_references<cr>") -- goes to class or variable definition
keymap.set("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>") -- live grep
keymap.set("n", "<C-n>", "<cmd>Neotree toggle<cr>") -- Toggles neotree
keymap.set("n", "<Leader>gd", "<cmd>Telescope lsp_definitions<cr>") -- goes to class or variable definition of word under cursor
keymap.set("n", "<Leader>gtd", "<cmd>Telescope lsp_type_definitions<cr>") -- goes to the definition of the *TYPE* of the word under cursor
keymap.set("n", "<Leader>zz", "<cmd>ZenMode<cr>") -- toggles focus mode for current window
keymap.set('n', "<Leader><Tab>", "<cmd>b#<cr>") -- Switches to previous opened buffer

-- nvim dap (debugging)
keymap.set("n", "<Leader>db", "<cmd>DapToggleBreakpoint<cr>") -- toggles breakpoint on current line
keymap.set("n", "<Leader>dca", "<cmd>DapClearBreakpoints<cr>") -- clears all breakpoints
keymap.set("n", "<F5>", "<cmd>DapContinue<cr>") -- moves to the next breakpoint while running
keymap.set("n", "<Leader>dt", "<cmd>DapToggleRepl<cr>")
keymap.set("n", "<C-F5>", "<cmd>DapNew<cr>")

-- Trouble
keymap.set("n", "<Leader>xx", "<cmd>Trouble diagnostics toggle focus=true<cr>") -- Opens trouble
keymap.set("n", "<Leader>xc", "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>") -- Opens trouble for current buffer only


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
