return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change

    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "saghen/blink.cmp",
      "echasnovski/mini.icons",
      "folke/snacks.nvim",
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
        ---@module 'render-markdown'
        -- @type render.md.UserConfig
        opts = {
          completions = {
            lsp = { enabled = true },
            blink = { enabled = true },
          },
          file_types = { "markdown", "Avante" },
          -- log_level = "debug",
          -- overrides = {
          --   buftype = {
          --     nofile = {
          --       render_modes = { "n", "c", "i" },
          --       debounce = 5,
          --     },
          --   },
          -- filetype = {},
          -- },
        },
        ft = { "markdown", "Avante" },
      },
    },
    config = function()
      require("avante").setup({
        provider = "ollama",
        claude = {
          endpoint = "https://api.anthropic.com",
          -- model = "claude-3-7-sonnet-20250219",
          model = "claude-3-5-sonnet-20241022",
          temperature = 0,
          timeout = 30000,
          max_tokens = 4096,
          -- disable_tools = true,
        },
        ollama = {
          endpoint = "http://192.168.1.70:11434",
          model = "devstral:latest",
          -- model = "gemma3:27b",
          options = {
            temperature = 0,
            num_ctx = 32768,
          },
        },
        behaviour = {
          enable_cursor_planning_mode = true, -- enable cursor planning mode!
        },
        file_selector = {
          -- @alias FileSelectorProvider "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string | fun(params: avante.file_selector.IParams|nil): nil
          provider = "snacks",
          -- Options override for custom providers
          -- provider_opts = {},
        },
        -- The system_prompt type supports both a string and a function that returns a string. Using a function here allows dynamically updating the prompt with mcphub
        system_prompt = function()
          local hub = require("mcphub").get_hub_instance()
          return hub:get_active_servers_prompt()
        end,
        -- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
        custom_tools = function()
          return {
            require("mcphub.extensions.avante").mcp_tool(),
          }
        end,
        -- disabled_tools = {
        --   "list_files",
        --   "search_files",
        --   "read_file",
        --   "create_file",
        --   "rename_file",
        --   "delete_file",
        --   "create_dir",
        --   "rename_dir",
        --   "delete_dir",
        --   "bash",
        -- },
      })
    end,
  },
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
    },
    -- cmd = "MCPHub", -- lazily start the hub when `MCPHub` is called
    build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
    config = function()
      require("mcphub").setup({
        -- Required options
        port = 3050, -- Port for MCP Hub server
        config = vim.fn.expand("/Users/win/.config/nvim/mcpservers.json"), -- Absolute path to config file

        -- Optional options
        on_ready = function(hub)
          -- Called when hub is ready
        end,
        on_error = function(err)
          -- Called on errors
        end,
        log = {
          level = vim.log.levels.DEBUG, -- More verbose logging
          to_file = true, -- Enable file logging
          file_path = "/Users/win/logs/mcphub.log", -- Custom log path
          prefix = "MCPHub", -- Log prefix
        },
        auto_approve = true,
        extensions = {
          avante = {
            make_slash_commands = true, -- make /slash commands from MCP server prompts
          },
        },
      })
    end,
  },
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
      require("claude-code").setup({
        keymaps = {
          toggle = {
            normal = "<leader>cc", -- Normal mode keymap for toggling Claude Code, false to disable
            terminal = "<leader>cc", -- Terminal mode keymap for toggling Claude Code, false to disable
            variants = {
              continue = "<leader>cC", -- Normal mode keymap for Claude Code with continue flag
              verbose = "<leader>cV", -- Normal mode keymap for Claude Code with verbose flag
            },
          },
          window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
          scrolling = true, -- Enable scrolling keymaps (<C-f/b>) for page up/down
        },
      })
    end,
  },
}
