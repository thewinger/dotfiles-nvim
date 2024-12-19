local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.runtimepath:prepend({ lazypath })

local installed, lazy = pcall(require, "lazy")
if not installed then
  return
end

lazy.setup({
  -- importing directories
  spec = {
    {
      -- dir = "/Users/win/Developer/tailcarbon.nvim",
      "thewinger/tailcarbon.nvim",
      init = function()
        vim.cmd.colorscheme("oxocarbon")
        vim.api.nvim_set_hl(0, "WinBar", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
      end,
    },
    { import = "plugins" },
  },
  install = { colorscheme = { "tailscheme" } },
  -- ui config
  ui = {
    border = "double",
    size = {
      width = 0.8,
      height = 0.8,
    },
  },

  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
