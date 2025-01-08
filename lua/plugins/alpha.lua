return {
  "goolord/alpha-nvim",
  opts = {},
  config = function()
    require("alpha").setup(require("alpha.themes.dashboard").config)
  end,
}
