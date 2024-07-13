return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "catppuccin-mocha"
    require("catppuccin").setup {
      integrations = {
        cmp = true,
        neotree = true,
        treesitter = true,
        alpha = true,
        telescope = {
          enabled = true
        },
        which_key = true
      }
    }
  end
}
