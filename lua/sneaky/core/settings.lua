vim.cmd("set number") -- just show the line numbers

-- Sets up the vim tab spaces, the default is fucking 8 jesus christ
local tab_size = 2
vim.o.tabstop = tab_size
vim.o.shiftwidth = tab_size
vim.wo.relativenumber = true
vim.opt.ignorecase = true -- makes it so that searching with "/" is case insensitive
vim.opt.shadafile = "NONE" -- Disables shada files because they piss me off
vim.o.messagesopt = "history:500,wait:1000" -- Disables the "Hit Enter" shit and just shows the message for 1s instead

-- Sets up term
if vim.fn.has("win32") == 1 then
	vim.g.terminal_emulator = "powershell"
	vim.opt.shell = "powershell"
	-- Don't mind the code here copied from SO for PS to work
	vim.o.shellxquote = ""
	vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
	vim.o.shellquote = ""
	vim.o.shellpipe = "| Out-File -Encoding UTF8 %s"
	vim.o.shellredir = "| Out-File -Encoding UTF8 %s"
end

-- Adds border to <S-k> hover
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "rounded", -- Options: 'none', 'single', 'double', 'rounded', 'solid'
  }
)

-- Resizes all windows to equal sizes when new buf opened
vim.api.nvim_create_autocmd({"BufWinEnter"}, {
	callback = function(e)
		vim.cmd("wincmd=")
	end
})

