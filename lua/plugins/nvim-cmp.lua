-----------------------------------------------------------
-- LSP Zero configuration file
-----------------------------------------------------------
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

-- Call setup.
nvim_cmp.setup({
    preselect = nvim_cmp.PreselectMode.None,
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
    },

    -- Completion settings.
    completion = {
        -- Equivalent to completeopt = "menu,menuone,noselect".
        keyword_length = 2
    },

    -- Key mappings.
    mapping = {
        -- Abort mappings on ESC.
        ["<ESC>"] = nvim_cmp.mapping.abort(),

        -- Complete on ENTER.
        ["<CR>"] = nvim_cmp.mapping.confirm {
            behavior = nvim_cmp.ConfirmBehavior.Replace,
            select = true,
        },

        -- Move to next recommendation on TAB.
        ["<Tab>"] = function(fallback)
            if nvim_cmp.visible() then
                nvim_cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,

        -- Move to previous recommendation on SHIFT-TAB.
        ["<S-Tab>"] = function(fallback)
            if nvim_cmp.visible() then
                nvim_cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end
    },

    -- Configure the suggestions window.
    window = {
        completion = nvim_cmp.config.window.bordered(),
        documentation = nvim_cmp.config.window.bordered(),
    },

    -- Assign the snippets' engine.
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    }
})
