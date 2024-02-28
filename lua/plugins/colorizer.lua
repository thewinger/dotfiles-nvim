return {
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
}
