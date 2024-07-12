local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("BufLeave", {
  desc = "Hide tabufline if only one buffer and one tab are open",
  pattern = "*",
  group = augroup("TabuflineHide", { clear = true }),
  callback = function()
    vim.schedule(function()
      if #vim.t.bufs <= 1 and #vim.api.nvim_list_tabpages() <= 1 then
        vim.o.showtabline = 0
      else
        vim.o.showtabline = 2
      end
    end)
  end,
})

autocmd("FileType", {
  desc = "Workaround for NvCheatsheet's zindex being higher than Mason's.",
  pattern = "nvcheatsheet",
  group = augroup("FixCheatsheetZindex", { clear = true }),
  callback = function()
    vim.api.nvim_win_set_config(0, { zindex = 44 })
  end,
})

autocmd({ "BufEnter", "FileType" }, {
  desc = "Prevent auto-comment on new line.",
  pattern = "*",
  group = augroup("NoNewLineComment", { clear = true }),
  command = [[
    setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  ]],
})

autocmd("VimLeavePre", {
  desc = "Close NvimTree before quitting nvim.",
  pattern = "*",
  group = augroup("NvimTreeCloseOnExit", { clear = true }),
  callback = function()
    if vim.bo.filetype == "NvimTree" then
      vim.api.nvim_buf_delete(0, { force = true })
    end
  end,
})

autocmd("TextYankPost", {
  desc = "Highlight on yank.",
  group = augroup("HighlightOnYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank { higroup = "YankVisual", timeout = 200, on_visual = true }
  end,
})

autocmd("BufWritePre", {
  desc = "Remove trailing whitespaces on save.",
  group = augroup("TrimWhitespaceOnSave", { clear = true }),
  command = [[ %s/\s\+$//e ]],
})

autocmd("FileType", {
  desc = "Define windows to close with 'q'",
  pattern = {
    "empty",
    "help",
    "startuptime",
    "qf",
    "query",
    "lspinfo",
    "man",
    "checkhealth",
    "nvcheatsheet",
    "codecompanion",
  },
  group = augroup("WinCloseOnQDefinition", { clear = true }),
  command = [[
    nnoremap <buffer><silent> q :close<CR>
    set nobuflisted
  ]],
})

autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  desc = "Automatically update changed file in nvim.",
  group = augroup("AutoupdateOnFileChange", { clear = true }),
  command = [[
    silent! if mode() != 'c' && !bufexists("[Command Line]") | checktime | endif
  ]],
})

autocmd("FileChangedShellPost", {
  desc = "Show notification on file change.",
  group = augroup("NotifyOnFileChange", { clear = true }),
  command = [[
    echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
  ]],
})
