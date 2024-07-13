return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })
    config.setup({
      auto_install = true,
      ensure_installed = { "lua", "javascript", "typescript" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
