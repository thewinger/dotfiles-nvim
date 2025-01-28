return {
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
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function()
      -- vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
