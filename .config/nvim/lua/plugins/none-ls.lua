return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				require("none-ls.diagnostics.eslint_d"), -- TS | JS
				require("none-ls.code_actions.eslint_d"),
				require("none-ls.formatting.beautysh"),
				require("none-ls.formatting.eslint_d"),
				require("none-ls.formatting.jq"),
				null_ls.builtins.diagnostics.stylelint,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.prettierd.with({
					filetypes = {
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"vue",
						"css",
						"scss",
						"less",
						"html",
						"json",
						"jsonc",
						"yaml",
						"markdown",
						"markdown.mdx",
						"graphql",
						"handlebars",
					},
					extra_filetypes = { "toml", "svelte" },
				}),
			},
		})
    vim.keymap.set('n', '<Leader><Leader>f', vim.lsp.buf.format, {})
  end
}
