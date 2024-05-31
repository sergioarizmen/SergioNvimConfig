-----------------------------------------------------------
-- LSP Zero configuration file.
-----------------------------------------------------------
--
-- Plugin: lsp-zero
-- url: https://github.com/VonHeikemen/lsp-zero.nvim

-- Check if the plugin is properly installed.
local nvim_cmp_status, nvim_cmp = pcall(require, "cmp")
if not nvim_cmp_status then
  return
end

-- Check if a plugin dependency is properly installed.
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end

-- Check if a plugin dependency is properly installed.
local luasnip_loader_status, luasnip_loader = pcall(require, "luasnip.loaders.from_vscode")
if not luasnip_loader_status then
  return
end

-- Lazy load the luasnip plugin.
luasnip_loader.lazy_load()

--
lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())

-- Call setup.
nvim_cmp.setup({
    preselect = nvim_cmp.PreselectMode.None,
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
    mapping = {
        ['<CR>'] = nvim_cmp.mapping.confirm({
            behavior = nvim_cmp.ConfirmBehavior.Replace,
            select = false
        }),
    },
    window = {
        completion = nvim_cmp.config.window.bordered(),
        documentation = nvim_cmp.config.window.bordered(),
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    }
})
