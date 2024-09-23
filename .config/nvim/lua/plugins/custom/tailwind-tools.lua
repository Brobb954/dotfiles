-- tailwind-tools.lua
---@type NvPluginSpec
return {
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim", -- optional
    "neovim/nvim-lspconfig", -- optional
  },

  init = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == "tailwindcss" then
          require "tailwind-tools"
          return true
        end
      end,
    })
  end,

  config = function()
    local tt = require "tailwind-tools"
    tt.setup {
      document_color = {
        enabled = true,
        kind = "inline",
        inline_symbol = "󰝤",
      },
      cmp = {
        highlight = "background",
      },
    }

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.templ", "*.jsx", "*.tsx", "*.js", "*.ts", "*.html", "*.astro", "*.mjs", "*.css" },
      callback = function()
        vim.cmd "TailwindSort"
      end,
    })
  end,
}
