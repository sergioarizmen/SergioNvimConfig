-----------------------------------------------------------
-- LSP Zero configuration file.
-----------------------------------------------------------
--
-- Plugin: lsp-zero
-- url: https://github.com/VonHeikemen/lsp-zero.nvim

-- Check if the plugin is properly installed.
local lsp_zero_status, lsp_zero = pcall(require, "lsp-zero")
if not lsp_zero_status then
    return
end

-- Check if a plugin dependency is properly installed.
local lsp_status_ok, lspconfig = pcall(require, "lspconfig")
if not lsp_status_ok then
    return
end

-- Check if a plugin dependency is properly installed.
local navic_status, navic = pcall(require, "nvim-navic")
if not navic_status then
    return
end

-- Configure the lua language server to the lsp_zero language server.
lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())

-- On the call to attach the lsp server.
lsp_zero.on_attach(function(client, bufnr)
    -- Add the keybindings.
    lsp_zero.default_keymaps({buffer = bufnr})

    -- Attach navic to the document symbol provider.
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end)

-- Call setup.
lsp_zero.setup()
