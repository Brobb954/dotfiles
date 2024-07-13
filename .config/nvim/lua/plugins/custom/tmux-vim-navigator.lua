return {
  "christoomey/vim-tmux-navigator",
  vim.keymap.set("n", "<c-h>", ":TmuxNavigateLeft<cr>"),
  vim.keymap.set("n", "<c-j>", ":TmuxNavigateDown<cr>"),
  vim.keymap.set("n", "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>"),
  vim.keymap.set("n", "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>"),
  vim.keymap.set("n", "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>"),
}
