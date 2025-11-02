return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    "tpope/vim-dadbod",
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "psql" } },
  },
  cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection" },
  keys = {
    { "<leader>Du", "<cmd>DBUIToggle<CR>", desc = "DB UI toogle" },
    { "<leader>Da", "<cmd>DBUIAddConnection<CR>", desc = "DB Add a db connection" },
    { "<leader>Df", "<cmd>DBUIFindBuffer<CR>", desc = "DB find a db buffer" },
    { "<leader>Dr", "<cmd>DBUIRenameBuffer<CR>", desc = "DB rename a db buffer" },
  },
  init = function()
    vim.g.db_ui_save_location = vim.fn.stdpath "config" .. "/db_ui"
  end,
}
