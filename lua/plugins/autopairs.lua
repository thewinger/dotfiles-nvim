return {
  "windwp/nvim-autopairs",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({})
    require("nvim-ts-autotag").setup({})
  end,
}
