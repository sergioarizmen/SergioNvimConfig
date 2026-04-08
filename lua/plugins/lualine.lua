-----------------------------------------------------------
-- Lualine configuration file
-----------------------------------------------------------
-- Plugin: lualine.nvim
-- url: https://github.com/nvim-lualine/lualine.nvim

-- Check if the plugin is properly installed.
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

-- Call setup.
lualine.setup({
    options = {
        theme = "auto",
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {
            -- Show the current recording macro or other noice status
            {
                function()
                    return require("noice").api.statusline.mode.get()
                end,
                cond = function()
                    return package.loaded["noice"] and require("noice").api.statusline.mode.has()
                end,
                color = { fg = "#ff9e64" },
            },
            "encoding",
            "fileformat",
            "filetype"
        },
        lualine_y = { "progress" },
        lualine_z = { "location" }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { "nvim-tree", "lazy" }
})
