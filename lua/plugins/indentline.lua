return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    --[[ local highlight = {
      "Normal",
      "Whitespace",
    }
    require("ibl").setup({
      indent = { highlight = highlight, char = "" },
      whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
      },
      scope = { enabled = true, char = " ", highlight = "NonText", show_start = true },
    })
    vim.cmd.highlight("clear @ibl.scope.underline.1")
    vim.cmd.highlight("link @ibl.scope.underline.1 Visual") ]]
  end,
}
