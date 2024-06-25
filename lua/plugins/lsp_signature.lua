-----------------------------------------------------------
-- LSP Signature configuration file.
-----------------------------------------------------------
--
-- Plugin: lsp_signature
-- url: https://github.com/VonHeikemen/lsp-zero.nvim

-- Check if the plugin is properly installed.
local lsp_signature_status, lsp_signature = pcall(require, "lsp_signature")
if not lsp_signature_status then
    return
end

-- Call setup.
lsp_signature.setup()
