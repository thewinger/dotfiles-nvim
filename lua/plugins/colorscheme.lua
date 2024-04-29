return {
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
}
