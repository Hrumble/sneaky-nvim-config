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
keymap.set("n", "<Leader>tt", "<cmd>Telescope colorscheme<cr>")
keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>")
keymap.set('n', '<C-n>', '<cmd>Neotree toggle<cr>')
keymap.set('n', '<Leader>xx', '<cmd>Trouble diagnostics toggle focus=true<cr>') -- Opens trouble 
keymap.set('n', '<Leader>xc', '<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>') -- Opens trouble for current buffer only

-- Term keymaps
vim.keymap.set({ "t", "n" }, "<A-t>", "<cmd>ToggleTermToggleAll<cr>")
vim.keymap.set({ "t", "n" }, "<A-1>", "<cmd>1ToggleTerm direction=horizontal size=15 name=1<cr>")
vim.keymap.set({ "t", "n" }, "<A-2>", "<cmd>2ToggleTerm direction=horizontal size=15 name=2<cr>")
vim.keymap.set({ "t", "n" }, "<A-3>", "<cmd>3ToggleTerm direction=horizontal size=15 name=3<cr>")
vim.keymap.set({ "t", "n" }, "<A-4>", "<cmd>4ToggleTerm direction=horizontal size=15 name=4<cr>")
vim.keymap.set({ "t", "n" }, "<A-5>", "<cmd>5ToggleTerm direction=horizontal size=15 name=5<cr>")
vim.keymap.set({ "t", "n" }, "<A-6>", "<cmd>6ToggleTerm direction=horizontal size=15 name=6<cr>")
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)

-- Sets y to copy to clipboard
vim.cmd("set clipboard=unnamedplus")
