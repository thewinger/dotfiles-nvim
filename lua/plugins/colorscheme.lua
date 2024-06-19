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
  { "EdenEast/nightfox.nvim", name = "nightfox" },
  { "rose-pine/neovim", name = "rose-pine" },
  {
    "nyoom-engineering/oxocarbon.nvim",
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
  {
    "diegoulloao/neofusion.nvim",
    priority = 1000,
    config = function()
      require("neofusion").setup({
        transparent_mode = true,
        overrides = {
          Comment = { fg = "#f5f5f5" },
        },
        options = {
          theme = require("neofusion.lualine"),
        },
      })
      -- vim.cmd([[colorscheme neofusion]])
    end,
  },
}
