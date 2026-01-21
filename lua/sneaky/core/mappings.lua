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

-- Tabby
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

-- GROPER
keymap.set("n", "<leader>gg", function() require("grope-nvim").live_grep() end)

-- maps code actions
keymap.set("n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", { noremap = true, silent = true })

-- maps to reload nvim conf
keymap.set("n", "<Leader>nrr", "<cmd>source<cr>")

-- Random
keymap.set("n", "<Leader>fmlg", "<cmd>CellularAutomaton game_of_life<cr>")
keymap.set("n", "<Leader>fmlm", "<cmd>CellularAutomaton make_it_rain<cr>")

-- Awareness
keymap.set("n", "<Leader>zz", "<cmd>Twilight<cr>", { desc = "Toggles twilight to focus on current edited scope" })

-- Accents
keymap.set("i", "<A-'>", "<C-k>'")
keymap.set("i", "<A-`>", "<C-k>`")

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
end, { desc = "renames a function or variable in the entire project" })      -- renames a function or variable in the entire project
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
)                                                                                                        -- browse available colorschemes with telescope
keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", { desc = "browse files with telescope" }) -- browse files with telescope
keymap.set("n", "<Leader>fc", "<cmd>Telescope commands<cr>", {
	desc = "Opens a list of all available commands to the user",
})                                       -- Opens a list of all available commands to the user
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

keymap.set("n", "<Leader>fr", "<cmd>Telescope lsp_references fname_width=100<cr>", { desc = "goes to class or variable definition" }) -- goes to class or variable definition
keymap.set("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "live grep" })                                 -- live grep
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
)                                                                                                -- goes to the definition of the *TYPE* of the word under cursor
keymap.set("n", "<Leader><Tab>", "<cmd>b#<cr>", { desc = "Switches to previous opened buffer" }) -- Switches to previous opened buffer

-- Trouble
keymap.set("n", "<Leader>xx", "<cmd>Trouble diagnostics toggle focus=true<cr>")              -- Opens trouble
keymap.set("n", "<Leader>xc", "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>") -- Opens trouble for current buffer only

-- LazyGit
keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- Mini
keymap.set("n", "<BS>", function() MiniFiles.open(nil, true) end)
keymap.set("n", "|", function() MiniFiles.open(vim.api.nvim_buf_get_name(0), false) end)

-- nvim dap
-- See lua/sneaky/plugins/debugging.lua

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
