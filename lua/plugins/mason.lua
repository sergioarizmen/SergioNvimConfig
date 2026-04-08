-----------------------------------------------------------
-- Mason plugin configuration file
-----------------------------------------------------------
-- Plugin: mason
-- url: https://github.com/williamboman/mason.nvim

-- Check if the plugin is properly installed.
local mason_tool_installer_status, mason_tool_installer = pcall(require, "mason-tool-installer")
if not mason_tool_installer_status then
    return
end

-- Check if a plugin dependency is properly installed.
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    return
end

-- NOTE: By default, Neovim doesn't support everything that is in the LSP specification.
-- Modules like: blink.cmp, luasnip, etc. add *more* capabilities to Neovim.
-- So, blink.cmp is used to gather the full set of capabilities.
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Setup each LSP.
local servers = require("plugins.config.lsp-tools-list")
for name, configuration in pairs(servers) do
    configuration = configuration or {}
    -- Allow capability overrides from each server's configuratio.
    configuration.capabilities = vim.tbl_deep_extend("force", {}, capabilities, configuration.capabilities or {})
    vim.lsp.config(name, configuration)
end

-- Call setup.
mason_tool_installer.setup({
    ensure_installed = vim.tbl_keys(servers or {})
})
mason_lspconfig.setup({
    -- Explicitly set to an empty table.
    -- Kickstart will populate installs via mason-tool-installer.
    ensure_installed = {},
    automatic_installation = false,
})

-----------------------------------------------------------
-- LSP autocamnds
-----------------------------------------------------------

-- Get the custom utility map function.
local map = require("core.utils.map")

-- Attach configuration options depending on a buffer type.
-- Gets run when an LSP attaches to a particular buffer.
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
    callback = function(event)
        -- Define default buffer options.
        local options = { buffer = event.buf }

        -- Rename the variable under the cursor.
        map("n", "<leader>cr", vim.lsp.buf.rename, "LSP: [C]ode [R]ename", options)

        -- Execute a code action, usually the cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "LSP: [C]ode [A]ction", options)

        map({ "n", "x" }, "<leader>cd", vim.lsp.buf.hover, "LSP: [C]ode [D]ocumentation", options)

        -- Find references for the word under the cursor.
        map("n", "gr", function() Snacks.picker.lsp_references() end,
            "LSP: [G]oto [R]eferences", options)

        -- Jump to the implementation of the word under the cursor.
        -- Useful when the language has ways of declaring types without an actual implementation.
        map("n", "gI", function() Snacks.picker.lsp_implementations() end,
            "LSP: [G]oto [I]mplementation", options)

        -- Jump to the definition of the word under the cursor.
        -- This is where a variable was first declared, or where a function is defined, etc.
        -- To jump back, press <C-t>.
        map("n", "gd", function() Snacks.picker.lsp_definitions() end,
            "LSP: [G]oto [D]efinition", options)

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        -- For example, in C this would take the cursor to the header.
        map("n", "gD", function() Snacks.picker.lsp_declarations() end,
            "LSP: [G]oto [D]eclaration", options)

        -- Fuzzy find all the symbols in the current document.
        map("n", "<leader>cs", function() Snacks.picker.lsp_symbols() end,
            "LSP: [C]ode [S]ymbols", options)

        -- Fuzzy find all the symbols in the current workspace.
        map("n", "<leader>cS", function() Snacks.picker.lsp_workspace_symbols() end,
            "LSP: [C]ode Workspace [S]ymbols", options)

        -- Jump to the *type* definition of the word under the cursor.
        map("n", "gt", function() Snacks.picker.lsp_type_definitions() end,
            "LSP: [G]oto [T]ype Definition", options)

        -- Attach autocomands to highlight references of the word under the cursor.
        -- See `:help CursorHold` for information about when this is executed
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            -- Display highlight when the cursor rests on a given reference.
            local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            -- Remove highlight display when the cursor is moved.
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            -- Remove highlight display when the LSP is detached.
            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
                end,
            })
        end

        -- The following code creates a keymap to toggle inlay hints in code, if supported by the LSP.
        -- WARN: This visually displaces the code.
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map("n", "<leader>uh", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, "[U]I Toggle Inlay [H]ints", options)
        end
    end,
})
