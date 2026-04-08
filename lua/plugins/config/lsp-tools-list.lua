-- Enabled and autoinstalled language servers / tools.
--
-- Available overrides are:
-- - cmd (table): Override the default command used to start the server.
-- - filetypes (table): Override the default list of associated filetypes for the server,
-- - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
-- - settings (table): Override the default settings passed when initializing the server.
--      NOTE: Each language server / tool may have its own list of settings.
return {
    gopls = {},         -- Go LSP.
    intelephense = {},  -- PHP LSP.
    jsonls = {},        -- JSON LSP.
    postgres_lsp = {},  -- Postgres LSP.
    pyright = {},       -- Python LSP.
    rust_analyzer = {}, -- Rust-analyzer.
    tailwindcss = {},   -- Tailwindcss LSP.
    ts_ls = {},         -- Typescript LSP.
    prettier = {},      -- Typescript formatter.
    lua_ls = {          -- Lua LSP.
        settings = {
            Lua = {
                completion = {
                    callSnippet = "Replace",
                },
            },
        },
    },
    stylua = {},        -- Lua formatter.
}
