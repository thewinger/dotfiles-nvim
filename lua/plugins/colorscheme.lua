return {
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   config = function()
  --     -- vim.cmd("colorscheme rose-pine-moon")
  --   end,
  -- },
  {
    "thewinger/Base2Tone-nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme("base2tone_space_dark")
    end,
  },
  {
    "idr4n/github-monochrome.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("github-monochrome").setup({})
      --   style = "rosepine",
      --   transparent = true,
      --   styles = {
      --     float = "normal",
      --   },
      --   on_colors = function(c, s)
      --     if s == "rosepine" then
      --       c.bg = "#232136"
      --       c.bg_float = "#232136"
      --     end
      --   end,
      -- })
      -- vim.cmd.colorscheme("github-monochrome-rosepine")
    end,
  },
}
