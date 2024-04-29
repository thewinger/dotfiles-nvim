return {
  -- {
  --   "thewinger/tailscheme.nvim",
  --   dev = true,
  --   lazy = false,
  --   name = "tailscheme",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd([[colorscheme tailscheme]])
  --   end,
  -- },
  {
    dir = "/Users/win/Projects/tailscheme.nvim",
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
  -- {
  --   "EdenEast/nightfox.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- vim.cmd.colorscheme("duskfox")
  --   end,
  -- },
}
