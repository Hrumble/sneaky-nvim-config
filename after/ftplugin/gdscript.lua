vim.cmd([[
  augroup GDScriptRootDir
    autocmd!
    autocmd BufEnter *.gd lua ChangeToGodotRootDir()
  augroup END
]])

-- Function to change to the root directory containing `project.godot`
function ChangeToGodotRootDir()
	local project_file = vim.fn.findfile("project.godot", ".;/")
	local project_path = vim.fn.fnamemodify(project_file, ":p:h")
	vim.cmd('cd ' .. project_path)
end
