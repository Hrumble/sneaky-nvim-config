-- Sets up the vim tab spaces, the default is fucking 8 jesus christ
local tab_size = 2
vim.o.tabstop = tab_size
vim.o.shiftwidth = tab_size
vim.o.signcolumn='yes:2'

vim.o.number = true
vim.wo.relativenumber = true

vim.opt.ignorecase = true -- makes it so that searching with "/" is case insensitive
vim.opt.shadafile = "NONE" -- Disables shada files because they piss me off

-- Line endings
vim.opt.list = true
vim.opt.listchars = {
  tab = "- ",
}

-- Comment if you don't have alacritty
vim.g.terminal_emulator = "wt"

if vim.fn.has("win32") == 1 then
	vim.opt.shell = "powershell"
	-- Don't mind the code here copied from SO for PS to work
	vim.o.shellxquote = ""
	vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
	vim.o.shellquote = ""
	vim.o.shellpipe = "| Out-File -Encoding UTF8 %s"
	vim.o.shellredir = "| Out-File -Encoding UTF8 %s"
end

-- Resizes all windows to equal sizes when new buf opened
vim.api.nvim_create_autocmd({"BufWinEnter"}, {
	callback = function(e)
		vim.cmd("wincmd=")
	end
})

vim.api.nvim_create_autocmd({"FocusGained", "BufEnter"}, {
	callback=function()
		vim.cmd("checktime")
		local ok, neotree = pcall(require, "neo-tree.sources.manager")
		if ok then
			neotree.refresh("filesystem")
			neotree.refresh("git_status")
		end
	end
})
