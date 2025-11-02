---@type NvPluginSpec
return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    view = {
      signcolumn = "auto",
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
  },
}
