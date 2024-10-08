vim.g.mapleader = " "
vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- Install lazy if not in path
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.system { "git", "clone", "--filter=blob:none", lazyrepo, "--branch=stable", lazypath }
end

-- Prepend lazy to runtime path
vim.opt.rtp:prepend(lazypath)

-- Load plugins
local lazy_config = require "configs.lazy"
require("lazy").setup({
  { "Bilal2453/luvit-meta" },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- "${3rd}/luv/library",
        "luvit-meta/library",
        "wezterm-types/types",
        vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
        -- vim.fn.expand "$HOME/workspace/neovim/ui/nvchad_types",
      },
    },
  },
  {
    "NvChad/NvChad",
    -- dir = vim.fn.expand "$HOME/workspace/neovim/NvChad",
    -- dev = true,
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },
  { import = "plugins" },
}, lazy_config)

-- Load themes
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

-- Re-activate providers
for _, v in ipairs { "python3_provider", "node_provider" } do
  vim.g["loaded_" .. v] = nil
  vim.cmd("runtime " .. v)
end

-- No dashboard for me
vim.api.nvim_del_user_command "Nvdash"
