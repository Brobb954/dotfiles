return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			local on_attach = function(client, bufnr)
				client.server_capabilities.document_formatting = false
			end
			vim.diagnostic.config({
				virtual_text = false, -- Turn off inline diagnostics
			})
			vim.keymap.set("n", "<Leader>ds", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
			-- Go to next diagnostic (if there are multiple on the same line, only shows
			-- one at a time in the floating window)
			vim.keymap.set("n", "<Leader>dn", ":lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
			-- Go to prev diagnostic (if there are multiple on the same line, only shows
			-- one at a time in the floating window)
			vim.keymap.set("n", "<Leader>dp", ":lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				autostart = true,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				autostart = true,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
