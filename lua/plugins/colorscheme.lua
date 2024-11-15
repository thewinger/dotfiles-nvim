-- local colors = {
--   fg = "#F8FAFC",
--   bg = "#1E293B",
--   dark = "#0F172A",
--   white = "#F8FAFC",
--   comment = "#64748b",
--   gray_light = "#CBD5E1",
--   gray = "#94A3B8",
--   blue_bg = "#0c4a6e",
--   blue = "#7DD3FC",
--   green = "#5EEAD4",
--   cyan = "#67E8F9",
--   light_red = "#FECDD3",
--   red = "#fda4af",
--   orange = "#FDBA74",
--   yellow = "#FDE047",
--   purple = "#A78BFA",
--   magenta = "#F472B6",
--   cursor_fg = "#F8FAFC",
--   cursor_bg = "#0F172A",
--   sign_add = "#10B981",
--   sign_change = "#3B82F6",
--   sign_delete = "#EF4444",
--   tree_sign_add = "#22C55E",
--   tree_sign_change = "#EAB308",
--   error_red = "#EF4444",
--   warning_orange = "#F97316",
--   info_yellow = "#FACC15",
--   hint_blue = "#0EA5E9",
--   success_green = "#22C55e",
-- }

return {
  {
    -- dir = "/Users/win/Projects/tailscheme.nvim",
    "thewinger/tailscheme.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme tailscheme")
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      })
    end,

    -- optionally set the colorscheme within lazy config
    init = function()
      -- vim.cmd("colorscheme duskfox")
    end,
  }, -- lazy
  {
    "nyoom-engineering/oxocarbon.nvim",
    -- Add in any other configuration;
    --   event = foo,
    --   config = bar
    --   end,
    init = function()
      vim.cmd("colorscheme oxocarbon")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    end,
  },
  {},
}
