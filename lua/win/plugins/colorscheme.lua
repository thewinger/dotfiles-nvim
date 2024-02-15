return {
  "thewinger/tailscheme.nvim",
  lazy = false,
  name = "tailscheme",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("tailscheme")
  end,
}
