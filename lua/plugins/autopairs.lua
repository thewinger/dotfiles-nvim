return {
  "windwp/nvim-autopairs",
  dependencies = {
    {
      "windwp/nvim-ts-autotag",
      opts = {},
    },
  },
  event = "InsertEnter",
  opts = {},
  -- config = function()
  --   require("nvim-autopairs").setup({})
  --   require("nvim-ts-autotag").setup({})
  -- end,
}
