return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      -- "artemave/workspace-diagnostics.nvim",
      { "j-hui/fidget.nvim", opts = {} },
      {
        "OlegGulevskyy/better-ts-errors.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        config = {
          keymaps = {
            toggle = "<leader>dd", -- default '<leader>dd'
            go_to_definition = "<leader>dx", -- default '<leader>dx'
          },
        },
      },
    },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim", "Snacks", "MiniFiles", "Flash" },
              },
            },
          },
        },
        ts_ls = {
          on_attach = function(client, bufnr)
            require("workspace-diagnostics")
          end,
        },
        eslint = {},
        tailwindcss = {},
      },
    },
    config = function(_, opts)
      vim.diagnostic.config({
        virtual_text = false,
        -- virtual_text = {
        --   only_current_line = true,
        --   source = true,
        -- },
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "if_many",
          header = "",
          prefix = "",
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
          },
          numhl = {
            [vim.diagnostic.severity.WARN] = "WarningMsg",
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
            [vim.diagnostic.severity.HINT] = "DiagnosticHint",
          },
        },
        underline = true,
        update_in_insert = true,
        severity_sort = false,
      })

      require("mason").setup()

      require("mason-lspconfig").setup({
        -- ensure_installed = { "eslint", "ts_ls", "vtsls" },
      })

      local lspconfig = require("lspconfig")

      for server, config in pairs(opts.servers) do
        -- vim.lsp.config(server, config)
        lspconfig[server].setup(config)
        vim.lsp.enable(server)
      end
    end,
  },
}
