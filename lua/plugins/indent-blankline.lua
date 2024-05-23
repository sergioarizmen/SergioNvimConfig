-----------------------------------------------------------
-- Indent line configuration file.
-----------------------------------------------------------

-- Plugin: indent-blankline
-- url: https://github.com/lukas-reineke/indent-blankline.nvim

-- Check if the plugin is properly installed.
local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
    return
end

indent_blankline.setup {
    exclude = {
        filetypes = {
            "help",
            "dashboard",
            "git",
            "markdown",
            "text",
            "lspinfo",
            "packer",
            "NvimTree",
        },
        buftypes = {
            "terminal",
            "nofile",
        },
    },
}
