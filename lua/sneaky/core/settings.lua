vim.cmd("set number") -- just show the line numbers

-- Sets up the vim tab spaces, the default is fucking 8 jesus christ
local tab_size = 2
vim.o.tabstop = tab_size
vim.o.shiftwidth = tab_size

-- Sets up term
if vim.fn.has("win32") == 1 then
	vim.g.terminal_emulator = 'powershell'
	vim.opt.shell = 'powershell'
	-- Don't mind the code here copied from SO for PS to work
	vim.o.shellxquote = ''
	vim.o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
	vim.o.shellquote = ''
	vim.o.shellpipe = '| Out-File -Encoding UTF8 %s'
	vim.o.shellredir = '| Out-File -Encoding UTF8 %s'
end
