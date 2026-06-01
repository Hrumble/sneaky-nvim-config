local keymap = vim.keymap

-- Leader key
keymap.set({ "n", "v" }, "<Space>", "<Nop>")
vim.g.mapleader = " "

-- General
keymap.set("i", "jj", "<Esc>")

-- Split navigation with Alt
keymap.set({ "n", "t" }, "<A-j>", "<C-w>j")
keymap.set({ "n", "t" }, "<A-k>", "<C-w>k")
keymap.set({ "n", "t" }, "<A-h>", "<C-w>h")
keymap.set({ "n", "t" }, "<A-l>", "<C-w>l")

-- Tabs (tabby.nvim)
keymap.set("n", "<leader>tl", "<cmd>tabnext<cr>")
keymap.set("n", "<leader>th", "<cmd>tabp<cr>")
keymap.set("n", "<A-n>", "<cmd>tabnew<cr>")
keymap.set("n", "<A-p>", "<cmd>Tabby jump_to_tab<cr>")
keymap.set("n", "<A-c>", "<cmd>tabclose<cr>")

-- QuickFix
keymap.set("n", "<leader>ck", "<cmd>cprev<cr>")
keymap.set("n", "<leader>cj", "<cmd>cnext<cr>")
keymap.set("n", "<leader>co", "<cmd>copen<cr>")
keymap.set("n", "<leader>cc", "<cmd>cclose<cr>")

-- Git
keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<cr>", { desc = "Open git diff view" })

-- LSP
keymap.set("n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", { noremap = true, silent = true })
keymap.set("n", "<Leader>nrr", "<cmd>source<cr>")

-- Twilight
keymap.set("n", "<Leader>zz", "<cmd>Twilight<cr>", { desc = "Toggle twilight focus" })

-- Accent shortcuts
keymap.set("i", "<A-'>", "<C-k>'")
keymap.set("i", "<A-`>", "<C-k>`")

-- Visual QoL
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "<", "<gv", { desc = "Unindent selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent selection" })

-- Hover / diagnostics with borders
keymap.set("n", "<S-k>", function()
	vim.lsp.buf.hover({ border = "rounded" })
end, { noremap = true })
keymap.set("n", "<S-e>", function()
	vim.diagnostic.open_float({ border = "rounded" })
end, { noremap = true })

keymap.set("n", "<Leader>rn", function()
	vim.lsp.buf.rename()
end, { desc = "Rename symbol across project" })

keymap.set("n", "<S-u>", "<cmd>redo<cr>", { desc = "Redo" })

-- Aerial
keymap.set("n", "<Leader>a", "<cmd>AerialToggle<cr>", { desc = "Toggle aerial" })
keymap.set("n", "}", function()
	local aerial = require("aerial")
	if aerial.is_open then aerial.next() end
end, { desc = "Aerial next" })
keymap.set("n", "{", function()
	local aerial = require("aerial")
	if aerial.is_open then aerial.prev() end
end, { desc = "Aerial prev" })

-- Telescope
keymap.set("n", "<Leader>ft", "<cmd>Telescope colorscheme<cr>", { desc = "Browse colorschemes" })
keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap.set("n", "<Leader>fc", "<cmd>Telescope commands<cr>", { desc = "Browse commands" })
keymap.set("n", "<Leader>fb", function()
	require("telescope.builtin").buffers({
		sort_mru = true,
		show_all_buffers = false,
		ignore_current_buffer = true,
	})
end)
keymap.set("n", "<Leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document symbols" })
keymap.set("n", "<Leader>fr", "<cmd>Telescope lsp_references fname_width=100<cr><Esc>", { desc = "LSP references" })
keymap.set("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
keymap.set("n", "<Leader>gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Go to definition" })
keymap.set("n", "<Leader>gtd", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "Go to type definition" })
keymap.set("n", "<Leader><Tab>", "<cmd>b#<cr>", { desc = "Switch to previous buffer" })

-- Trouble
keymap.set("n", "<Leader>xx", "<cmd>Trouble diagnostics toggle focus=true<cr>")
keymap.set("n", "<Leader>xc", "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>")

-- Mini files
keymap.set("n", "<BS>", function() MiniFiles.open(nil, true) end)
keymap.set("n", "|", function() MiniFiles.open(vim.api.nvim_buf_get_name(0), false) end)

-- Terminals (toggleterm)
vim.keymap.set({ "t", "n" }, "<A-t>", "<cmd>ToggleTermToggleAll<cr>")
vim.keymap.set({ "t", "n" }, "<A-1>", "<cmd>1ToggleTerm direction=horizontal size=15 name=1<cr>")
vim.keymap.set({ "t", "n" }, "<A-2>", "<cmd>2ToggleTerm direction=horizontal size=15 name=2<cr>")
vim.keymap.set({ "t", "n" }, "<A-3>", "<cmd>3ToggleTerm direction=horizontal size=15 name=3<cr>")
vim.keymap.set({ "t", "n" }, "<A-4>", "<cmd>4ToggleTerm direction=horizontal size=15 name=4<cr>")
vim.keymap.set({ "t", "n" }, "<A-5>", "<cmd>5ToggleTerm direction=horizontal size=15 name=5<cr>")
vim.keymap.set({ "t", "n" }, "<A-6>", "<cmd>6ToggleTerm direction=horizontal size=15 name=6<cr>")
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])

-- Clipboard
vim.cmd("set clipboard=unnamedplus")
