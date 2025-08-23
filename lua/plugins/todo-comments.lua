-----------------------------------------------------------
-- Todo comments configuration file
----------------------------------------------------------
-- Plugin: todo-comments
-- url: https://github.com/folke/todo-comments.nvim

-- Check if the plugin is properly installed.
local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
    return
end

-- Call setup.
todo_comments.setup()
