return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = {
          adapter = "anthropic",
        },
        inline = {
          adapter = "anthropic",
        },
      },
    })
  end,
}
-- return {
--   "yetone/avante.nvim",
--   event = "VeryLazy",
--   lazy = false,
--   version = false, -- set this if you want to always pull the latest change
--   opts = {
--     -- add any opts here
--     -- for example
--     provider = "claude",
--     claude = {
--       endpoint = "https://api.anthropic.com",
--       model = "claude-3-5-sonnet-20241022",
--       temperature = 0,
--       max_tokens = 4096,
--     },
--     file_selector = { e
--       --- @alias FileSelectorProvider "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string | fun(params: avante.file_selector.IParams|nil): nil
--       provider = "native",
--       -- Options override for custom providers
--       provider_opts = {},
--     },
--   }, -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
--   build = "make",
--   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
--   dependencies = {
--     "nvim-treesitter/nvim-treesitter",
--     "stevearc/dressing.nvim",
--     "nvim-lua/plenary.nvim",
--     "MunifTanjim/nui.nvim",
--     --- The below dependencies are optional,
--     "hrsh7th/nvim-cmp",
--     "echasnovski/mini.icons",
--     {
--       -- support for image pasting
--       "HakonHarnes/img-clip.nvim",
--       event = "VeryLazy",
--       opts = {
--         -- recommended settings
--         default = {
--           embed_image_as_base64 = false,
--           prompt_for_file_name = false,
--           drag_and_drop = {
--             insert_mode = true,
--           },
--           -- required for Windows users
--           use_absolute_path = true,
--         },
--       },
--     },
--     {
--       -- Make sure to set this up properly if you have lazy=true
--       "MeanderingProgrammer/render-markdown.nvim",
--       ---@module 'render-markdown'
--       ---@type render.md.UserConfig
--       opts = {
--         file_types = { "markdown", "Avante" },
--         log_level = "debug",
--         overrides = {
--           buftype = {
--             nofile = {
--               render_modes = { "n", "c", "i" },
--               debounce = 5,
--             },
--           },
--           filetype = {},
--         },
--       },
--       ft = { "markdown", "Avante" },
--     },
--   },
-- }
