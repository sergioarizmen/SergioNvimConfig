-----------------------------------------------------------
-- Comment plugin configuration file
-----------------------------------------------------------
-- Plugin: Comment
-- url: https://github.com/numToStr/Comment.nvim

-- Check if the plugin is properly installed.
local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    return
end

-- Setup comment.
comment.setup()
