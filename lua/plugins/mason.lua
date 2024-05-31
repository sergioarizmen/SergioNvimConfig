-----------------------------------------------------------
-- Mason plugin configuration file.
-----------------------------------------------------------
--
-- Plugin: mason
-- url: https://github.com/williamboman/mason.nvim

-- Check if the plugin is properly installed.
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- Check if a plugin dependency is properly installed.
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

-- Check if a plugin dependency is properly installed.
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

-- Call mason's setup.
require('mason').setup({})

-- Call mason-lspconfig's setup.
require('mason-lspconfig').setup({
    handlers = {
        function(server_name)
            lspconfig[server_name].setup({})
        end,
    }
})
