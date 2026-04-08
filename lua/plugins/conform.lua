-----------------------------------------------------------
-- Conform configuration file
-----------------------------------------------------------
-- Plugin: conform
-- url: https://github.com/stevearc/conform.nvim

-- Check if the plugin is properly installed.
local conform_status, conform = pcall(require, "conform")
if not conform_status then
    return
end

-- Call setup.
conform.setup({
    notify_on_error = false,
    format_on_save = function(bufnr)
        -- Disable "format_on_save" for languages that don't have a well standardized coding style.
        local disable_filetypes = { c = true, cpp = true, lua = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
            return nil
        else
            return {
                timeout_ms = 500,
                lsp_format = "fallback",
            }
        end
    end,
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        go = {"gofmt", "gci"}
    },
})

-- Get the custom utility map function.
local map = require("core.utils.map")

-- Add formatting keymap.
map("n",
    "<leader>f",
    function()
        require("conform").format({ async = true, lsp_format = "fallback" })
    end,
    "[F]ormat buffer"
)
