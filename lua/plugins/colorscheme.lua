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
      vim.cmd("colorscheme tailscheme")
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
          ["@tag.attribute"] = { fg = "palette.white.dim" },
          ["@tag.delimiter"] = { fg = "syntax.bracket" },
          ["@tag.tsx"] = { fg = "palette.cyan" },
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

      -- vim.cmd("colorscheme nightfox")
    end,
  },
  -- {
  --   "aliqyan-21/darkvoid.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("darkvoid").setup({
  --       transparent = true, -- set true for transparent
  --       glow = true, -- set true for glow effect
  --       show_end_of_buffer = true, -- set false for not showing end of buffer
  --
  --       colors = {
  --         fg = "#c0c0c0",
  --         bg = "#1c1c1c",
  --         cursor = "#bdfe58",
  --         line_nr = "#404040",
  --         visual = "#303030",
  --         comment = "#585858",
  --         string = "#d1d1d1",
  --         func = "#e1e1e1",
  --         kw = "#f1f1f1",
  --         identifier = "#b1b1b1",
  --         type = "#a1a1a1",
  --         search_highlight = "#1bfd9c",
  --         operator = "#1bfd9c",
  --         bracket = "#e6e6e6",
  --         preprocessor = "#4b8902",
  --         bool = "#66b2b2",
  --         constant = "#b2d8d8",
  --
  --         -- gitsigns colors
  --         added = "#baffc9",
  --         changed = "#ffffba",
  --         removed = "#ffb3ba",
  --
  --         -- Pmenu colors
  --         pmenu_bg = "#1c1c1c",
  --         pmenu_sel_bg = "#1bfd9c",
  --         pmenu_fg = "#c0c0c0",
  --
  --         -- EndOfBuffer color
  --         eob = "#3c3c3c",
  --
  --         -- Telescope specific colors
  --         border = "#585858",
  --         title = "#bdfe58",
  --
  --         -- bufferline specific colors
  --         -- change this to change the colors of current or selected tab
  --         bufferline_selection = "#bdfe58",
  --       },
  --     })
  --     -- vim.cmd("colorscheme darkvoid")
  --   end,
  -- },
}
