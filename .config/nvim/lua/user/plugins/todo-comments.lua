local todo_ok, todo = pcall(require, "todo-comments")
if not todo_ok then
	vim.notify("todo-comments not ready")
	return
end

-- config https://github.com/folke/todo-comments.nvim#%EF%B8%8F-configuration
todo.setup()
