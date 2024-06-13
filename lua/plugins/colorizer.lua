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
      render = "background", -- 'background' or 'foreground' or 'virtual'
      enable_named_colors = true,
      enable_tailwind = true,
      custom_colors = {
        { label = "blueTW", color = "#3b82f6" },
        { label = "cyanTW", color = "#22d3ee" },
        { label = "tealTW", color = "#99f6e4" },
        { label = "greenTW", color = "#34d399" },
        { label = "pinkTW", color = "#f472b6" },
        { label = "purpleTW", color = "#c084fc" },
        { label = "lightredTW", color = "#fda4af" },
        { label = "redTW", color = "#fb7185" },
        { label = "orangeTW", color = "#fbbf24" },
        { label = "yellowTW", color = "#fde68a" },
      },
    })
  end,
}
