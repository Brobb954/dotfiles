---@type NvPluginSpec
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = function()
    require("tiny-inline-diagnostic").setup {
      multiple_diag_under_cursor = true,
    }
  end,
}
