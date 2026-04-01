local status_ok, notify = pcall(require, "notify")
if not status_ok then
    return
end

notify.setup({
    -- Default configurations
    background_colour = "#000000",
    fps = 30,
    icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = ""
    },
    level = 2,
    minimum_width = 50,
    render = "default",
    stages = "fade_in_slide_out",
    timeout = 3000,
    top_down = true
})

-- Set notify as the default for Neovim's vim.notify
vim.notify = notify
