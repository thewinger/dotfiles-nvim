return {
  {
    "thewinger/Base2Tone-nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd.colorscheme("base2tone_tailwind_dark")
      vim.cmd.colorscheme("default")
    end,
  },
  {
    "thewinger/phobos-anomaly.nvim",
    config = function()
      -- vim.cmd.colorscheme("phobos-anomaly")
    end,
    lazy = false,
    priority = 1000,
  },
}
