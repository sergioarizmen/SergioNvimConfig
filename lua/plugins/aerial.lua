-----------------------------------------------------------
-- Aerial plugin configuration file
-----------------------------------------------------------
-- Plugin: Aerial
-- url: https://github.com/stevearc/aerial.nvim

-- Check if the plugin is properly installed.
local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
    return
end

-- Setup aerial.
aerial.setup({
    -- Set the default direction.
    default_direction = "float",

    -- Determines where the aerial window will be opened.
    placement = "edge",

    -- Set key maps when aerial has attached to a buffer.
    on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'.
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
})

-- Add an open key map.
vim.keymap.set("n", "<leader>z", "<cmd>AerialToggle!<CR>")
