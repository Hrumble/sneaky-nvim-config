-- Sets split screen movement to use Alt
local keymap = vim.keymap
keymap.set('n', '<A-j>', '<C-w>j')
keymap.set('n', '<A-k>', '<C-w>k')
keymap.set('n', '<A-h>', '<C-w>h')
keymap.set('n', '<A-l>', '<C-w>l')
keymap.set('n', 'ca', ':lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })

vim.cmd("set clipboard=unnamedplus")

