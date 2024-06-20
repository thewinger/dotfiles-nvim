return {
  {
    -- dir = "/Users/win/Projects/tailscheme.nvim",
    "thewinger/tailscheme.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
    lazy = false,
    name = "tailscheme",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tailscheme]])
    end,
  },
  { "rose-pine/neovim", name = "rose-pine" },
  {
    "thewinger/oxocarbon.nvim",
    config = function()
      -- vim.cmd([[colorscheme oxocarbon]])
      -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "String", { fg = "#FFFFFF" })
    end,
    -- Add in any other configuration;
    --   event = foo,
    --   config = bar
    --   end,
  },
}
