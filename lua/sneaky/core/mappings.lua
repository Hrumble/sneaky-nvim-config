local keymap = vim.keymap
-- Sets leader key
keymap.set({'n', 'v'}, '<Space>', '<Nop>')
vim.g.mapleader = " "

-- Sets split screen movement to use Alt
keymap.set({'n', 't'}, '<A-j>', '<C-w>j')
keymap.set({'n', 't'}, '<A-k>', '<C-w>k')
keymap.set({'n', 't'}, '<A-h>', '<C-w>h')
keymap.set({'n', 't'}, '<A-l>', '<C-w>l')

-- maps code actions
keymap.set('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', { noremap = true, silent = true })

-- maps to reload nvim conf
keymap.set('n', '<Leader>rr', '<cmd>source<cr>')

-- Term keymaps
vim.keymap.set({'t', 'n'}, '<A-t>', '<cmd>ToggleTermToggleAll<cr>')
vim.keymap.set({'t', 'n'}, '<A-1>', '<cmd>1ToggleTerm direction=vertical size=200<cr>')
vim.keymap.set({'t', 'n'}, '<A-2>', '<cmd>2ToggleTerm direction=vertical size=200<cr>')
vim.keymap.set({'t', 'n'}, '<A-3>', '<cmd>3ToggleTerm direction=vertical size=200<cr>')
vim.keymap.set({'t', 'n'}, '<A-4>', '<cmd>4ToggleTerm direction=vertical size=200<cr>')
vim.keymap.set({'t', 'n'}, '<A-5>', '<cmd>5ToggleTerm direction=vertical size=200<cr>')
vim.keymap.set({'t', 'n'}, '<A-6>', '<cmd>6ToggleTerm direction=vertical size=200<cr>')
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)

-- Sets y to copy to clipboard
vim.cmd("set clipboard=unnamedplus")

