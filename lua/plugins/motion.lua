-- Leap.nvim
--[[ return {
  "ggandor/leap.nvim",
  config = function()
    -- require('leap').create_default_mappings()
  end,
  keys = {
    { "s", "<Plug>(leap-forward)" },
    { "S", "<Plug>(leap-backward)" },
  },
} ]]

-- Flash.nvim
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    jump = {
      -- automatically jump when there is only one match
      autojump = true,
    },
    modes = {
      char = {
        jump_labels = true,
        multi_line = false,
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<CR>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
