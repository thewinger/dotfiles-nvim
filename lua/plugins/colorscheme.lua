return {
  {
    -- dir = "/Users/win/Projects/tailscheme.nvim",
    "thewinger/tailscheme.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
    lazy = false,
    name = "tailscheme",
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme tailscheme")
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      local palettes = {
        all = {
          white = "#f8fafc",
          black = "#1d283a",
          gray = "#94a3b8",
          green = "#36d399",
          magenta = "#a689fa",
          red = "#fb6f84",
          yellow = "#fddf49",
          pink = "#f471b5",
          blue = "#7ed4fc",
          cyan = "#67e8f9",
        },
      }
      local specs = {
        nightfox = {
          syntax = {
            keyword = "pink",
            ["@type.scss"] = "pink",
            ["@type.css"] = "pink",
            ["@operator.lua"] = "syntax.operator",
          },
        },
      }
      local groups = {
        nightfox = {
          String = { fg = "palette.white.bright" },
          Number = { fg = "palette.magenta.bright" },
          Constant = { fg = "palette.magenta.bright" },
          Special = { fg = "palette.pink" },
          IncSearch = { fg = "palette.black", bg = "palette.yellow" },
          Substitute = { fg = "palette.black", bg = "palette.yellow" },
          Visual = { fg = "palette.black", bg = "palette.magenta" },

          ["@keyword.return"] = { fg = "palette.white.dim" },
          ["@function.builtin"] = { fg = "palette.white.dim" },
        },
      }

      require("nightfox").setup({
        palettes = palettes,
        specs = specs,
        groups = groups,
        options = {
          transparent = true,
          styles = {
            comments = "italic",
          },
        },
      })

      vim.cmd("colorscheme nightfox")
    end,
  },
}
