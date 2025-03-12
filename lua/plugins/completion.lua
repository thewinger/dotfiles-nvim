return {
  {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",

    version = "v0.*",
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- see the "default configuration" section below for full documentation on how to define
      -- your own keymap.
      keymap = {
        preset = "enter",
        ["<C-e>"] = { "show", "show_documentation", "hide_documentation" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      },

      completion = {
        accept = { auto_brackets = { enabled = true } },

        list = {
          selection = {
            -- preselect = true,
            -- auto_insert = true
            preselect = function(ctx)
              return ctx.mode ~= "cmdline" and not require("blink.cmp").snippet_active({ direction = 1 })
            end,
            -- auto_insert = function(ctx) return ctx.mode ~= 'cmdline' end,
          },
        },
        menu = {
          border = "single",

          cmdline_position = function()
            if vim.g.ui_cmdline_pos ~= nil then
              local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
              return { pos[1] - 1, pos[2] }
            end
            local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
            return { vim.o.lines - height, 0 }
          end,
          draw = {
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                  return kind_icon
                end,
                -- Optionally, you may also use the highlights from mini.icons
                highlight = function(ctx)
                  local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                  return hl
                end,
              },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 250,
          treesitter_highlighting = true,
          window = { border = "single" },
        },
      },
      appearance = {
        use_nvim_cmp_as_default = false,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },
      signature = { enabled = true, window = { border = "single" } },
      cmdline = {
        enabled = true,
        keymap = nil, -- Inherits from top level `keymap` config when not set
        sources = function()
          local type = vim.fn.getcmdtype()
          -- Search forward and backward
          if type == "/" or type == "?" then
            return { "buffer" }
          end
          -- Commands
          if type == ":" or type == "@" then
            return { "cmdline" }
          end
          return {}
        end,
        completion = {
          trigger = {
            show_on_blocked_trigger_characters = {},
            show_on_x_blocked_trigger_characters = nil, -- Inherits from top level `completion.trigger.show_on_blocked_trigger_characters` config when not set
          },
          menu = {
            auto_show = nil, -- Inherits from top level `completion.menu.auto_show` config when not set
            draw = {
              columns = { { "label", "label_description", gap = 1 } },
            },
          },
        },
      },
      sources = {
        default = { "lazydev", "codecompanion", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
          codecompanion = {
            name = "CodeCompanion",
            module = "codecompanion.providers.completion.blink",
            enabled = true,
          },
          lsp = {
            name = "LSP",
            module = "blink.cmp.sources.lsp",
            fallback = { "buffer" },
            -- Filter text items from the LSP provider, since we have the buffer provider for that
            transform_items = function(_, items)
              return vim.tbl_filter(function(item)
                return item.kind ~= require("blink.cmp.types").CompletionItemKind.Text
              end, items)
            end,
            opts = { tailwind_color_icon = "██" },
          },
          path = {
            name = "Path",
            module = "blink.cmp.sources.path",
          },
          snippets = {
            name = "Snippets",
            module = "blink.cmp.sources.snippets",
          },
          buffer = {
            name = "Buffer",
            module = "blink.cmp.sources.buffer",
            score_offset = 100,
          },
        },
        per_filetype = {
          codecompanion = { "codecompanion", "path", "buffer" },
        },
      },

      enabled = function()
        return not vim.tbl_contains({}, vim.bo.filetype)
          and vim.bo.buftype ~= "nofile"
          and vim.bo.buftype ~= "prompt"
          and vim.bo.buftype ~= "TelescopePrompt"
          and vim.bo.buftype ~= "snacks_picker_input"
          and vim.b.completion ~= false
      end,
    },
    opts_extend = {
      "sources.default",
    },
  },
}
