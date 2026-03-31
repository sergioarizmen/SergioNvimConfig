-----------------------------------------------------------
-- None ls configuration file
-----------------------------------------------------------
-- Plugin: none-ls
-- url: https://github.com/nvimtools/none-ls.nvim

-- Check if the plugin is properly installed.
local none_ls_status, none_ls = pcall(require, "null-ls")
if not none_ls_status then
    return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Call setup.
none_ls.setup({
    sources = {
        none_ls.builtins.formatting.prettier,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
