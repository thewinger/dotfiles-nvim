return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },

  version = "1.*",
  opts = {
    keymap = {
      preset = "enter",
      ["<Tab>"] = {
        function(cmp)
          if cmp.is_menu_visible() then
            return require("blink.cmp").select_next()
          elseif cmp.snippet_active() then
            return cmp.snippet_forward()
          end
        end,
        "fallback",
      },
      ["<S-Tab>"] = {
        function(cmp)
          if cmp.is_menu_visible() then
            return require("blink.cmp").select_prev()
          elseif cmp.snippet_active() then
            return cmp.snippet_backward()
          end
        end,
        "fallback",
      },
    },
    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      keyword = {
        range = "full",
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
      },
      accept = {
        auto_brackets = {
          enabled = true,
          override_brackets_for_filetypes = {
            tex = { "{", "}" },
          },
        },
      },
      menu = {
        min_width = 20,
        border = "single",
        draw = {
          -- columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" }, { "source_name" } },
          columns = function(ctx)
            if ctx.mode == "cmdline" then
              return { { "label", "label_description", gap = 1 } }
            else
              return { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" }, { "source_name" } }
            end
          end,

          -- draw.components.label.width.max = function(ctx)
          --     return ctx.mode == "cmdline" and 20 or 60
          -- end,
          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                return kind_icon
              end,
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
            kind = {
              text = function(ctx)
                return ctx.source_name == "cmdline" and "" or ctx.kind
              end,
            },
            source_name = {
              text = function(ctx)
                return ctx.source_name == "cmdline" and "" or ctx.source_name
              end,
            },

            label = {
              width = { fill = true, max = 60 },
              text = function(ctx)
                return ctx.label .. ctx.label_detail
              end,
              highlight = function(ctx)
                -- label and label details
                local highlights = {
                  { 0, #ctx.label, group = ctx.deprecated and "BlinkCmpLabelDeprecated" or "BlinkCmpLabel" },
                }
                if ctx.label_detail then
                  table.insert(
                    highlights,
                    { #ctx.label, #ctx.label + #ctx.label_detail, group = "BlinkCmpLabelDetail" }
                  )
                end

                -- characters matched on the label by the fuzzy matcher
                for _, idx in ipairs(ctx.label_matched_indices) do
                  table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
                end

                return highlights
              end,
            },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 100,
        update_delay_ms = 50,
        window = {
          max_width = math.min(80, vim.o.columns),
          border = "rounded",
        },
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
        avante = {
          module = "blink-cmp-avante",
          name = "Avante",
          enabled = true,
          opts = {
            -- options for blink-cmp-avante
            avante = {
              command = {
                get_kind_name = function(_)
                  return "AvanteCmd"
                end,
              },
              mention = {
                get_kind_name = function(_)
                  return "AvanteMention"
                end,
              },
            },
            kind_icons = {
              AvanteCmd = "",
              AvanteMention = "@",
            },
          },
        },
        lsp = {
          name = "LSP",
          enabled = true,
          module = "blink.cmp.sources.lsp",
          min_keyword_length = 2,
          fallbacks = {},
          score_offset = 75, -- the higher the number, the higher the priority
        },
        path = {
          name = "Path",
          module = "blink.cmp.sources.path",
          score_offset = 25,
          -- When typing a path, I would get snippets and text in the
          -- suggestions, I want those to show only if there are no path
          -- suggestions
          fallbacks = { "snippets", "buffer" },
          -- min_keyword_length = 2,
          opts = {
            trailing_slash = false,
            label_trailing_slash = true,
            get_cwd = function(context)
              return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
            end,
            show_hidden_files_by_default = true,
          },
        },
        buffer = {
          name = "Buffer",
          enabled = true,
          max_items = 3,
          module = "blink.cmp.sources.buffer",
          score_offset = 90, -- the higher the number, the higher the priority
        },
      },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
