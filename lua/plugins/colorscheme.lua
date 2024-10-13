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
  --         operator = "#f472b6",
  --         bracket = "#e6e6e6",
  --         preprocessor = "#4b8902",
  --         bool = "#f472b6",
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
  --
  --         -- LSP diagnostics colors
  --         error = "#dea6a0",
  --         warning = "#D0B8A8",
  --         hint = "#BEDC74",
  --         info = "#7FA1C3",
  --       },
  --     })
  --   end,
  -- },
}
