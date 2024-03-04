--[[ return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },

  config = function()
    require("colorizer").setup({
      filetypes = {
        "typescript",
        "typescriptreact",
        "javascript",
        "javascriptreact",
        "css",
        "html",
        "astro",
        "lua",
      },
      user_default_options = {
        names = false,
        css = true,
        css_fn = true,
        tailwind = "both",
      },
      buftypes = {},
    })
  end,
} ]]

return {
  "brenoprata10/nvim-highlight-colors",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-highlight-colors").setup({
      render = "virtual", -- or 'foreground' or 'virtual'
      enable_named_colors = true,
      enable_tailwind = true,
    })
  end,
}
