vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.softtabstop = -1
vim.opt.shiftwidth = 0
vim.o.signcolumn = 'yes:2'

vim.o.number = true
vim.wo.relativenumber = true

vim.opt.ignorecase = true
vim.opt.shadafile = "NONE"

-- Show tab characters
vim.opt.list = true
vim.opt.listchars = {
  tab = "- ",
}

vim.g.terminal_emulator = "alacritty"

-- .h files default to C
vim.g.c_syntax_for_h = 'c'

if vim.fn.has("win32") == 1 then
	vim.opt.shell = "powershell"
	vim.o.shellxquote = ""
	vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
	vim.o.shellquote = ""
	vim.o.shellpipe = "| Out-File -Encoding UTF8 %s"
	vim.o.shellredir = "| Out-File -Encoding UTF8 %s"
end

-- Equalise windows when a new buffer opens
vim.api.nvim_create_autocmd("BufWinEnter", {
	callback = function()
		vim.cmd("wincmd=")
	end
})

-- Reload file when focus returns
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	callback = function()
		vim.cmd("checktime")
	end
})

vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", { desc = "Show LSP Info" })
