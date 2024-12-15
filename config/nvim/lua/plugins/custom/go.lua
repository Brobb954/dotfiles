local autocmd = vim.api.nvim_create_autocmd
local map = function(mode, lhs, rhs, opts)
  local options = { buffer = true }
  if opts then
    options = vim.tbl_deep_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

---@type NvPluginSpec
return {
  "ray-x/go.nvim",
  ft = { "go", "gomod", "gowork", "gotmpl" },
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
    "folke/trouble.nvim", -- Added trouble.nvim
    "kyazdani42/nvim-web-devicons",
  },
  config = function()
    local lsp = require "brobb.lsp"

    require("go").setup {
      lsp_cfg = {
        capabilities = lsp.capabilities,
        on_attach = lsp.create_on_attach(),
      },
      lsp_inlay_hints = {
        enable = true,
        parameter_hints = {
          show = true,
        },
        type_hints = {
          show = true,
        },
      },

      linters = {
        enabled = true,
        golangci = true,
        staticcheck = true,
      },

      test_runner = true,
      run_in_floaterm = true,

      dap_debug = true,

      goimports = "gopls",
      fillstruct = "gopls",

      icons = {
        breakpoint = "", -- Replace with your chosen breakpoint icon
        currentpos = "", -- Replace with your chosen current position icon
      },

      trouble = {
        enabled = true,
        use_diagnostic_signs = true,
      },

      test_flags = { "-v" },
    }

    autocmd("FileType", {
      pattern = "go",
      callback = function()
        map("n", "<leader>ca", "<cmd>GoCodeAction<cr>", {desc = "Switch CA for Go Files"})
        map("n", "<leader>gi", "<cmd>GoInstallDeps<cr>", { desc = "Install Go Dependencies" })
        map("n", "<leader>gt", "<cmd>GoTest<cr>", { desc = "Go Test" })
        map("n", "<leader>gr", "<cmd>GoRun<cr>", { desc = "Go Run" })
        map("n", "<leader>gI", "<cmd>GoImpl<cr>", { desc = "Go Impl" })
        map("n", "<leader>gfs", "<cmd>GoFillStruct<cr>", { desc = "Go Fill Struct" })
      end,
    })
  end,
  event = { "CmdlineEnter" },
}
