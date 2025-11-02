require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "rust_analyzer", "vtsls" }
vim.lsp.enable(servers)
vim.diagnostic.config { virtual_text = false } -- Disable default virtual text

-- read :h vim.lsp.config for changing options of lsp servers
