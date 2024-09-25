return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<Leader>n", ":Neotree<CR>")
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree focus<CR>")
    local neotree = require("neo-tree")
    neotree.setup({
      close_if_last_window = true,
      sort_case_insensitive = true,
      window = {
        position = "left",
        width = 30,
        mappings = {
          ["P"] = { "toggle_preview", config = { use_float = true } },
          ["h"] = "open_split",
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
          hide_by_name = {},
          hide_by_pattern = {},
          always_show = {
            ".gitignore",
            ".env",
          },
          never_show = {
            ".git",
            ".Next",
            "node_modules",
          },
          never_show_by_pattern = {},
        },
        follow_current_file = {
          enabled = false,
          leave_dirs_open = false,
        },
      },
    })
  end,
}
