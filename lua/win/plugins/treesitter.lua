return {
  {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    require('nvim-treesitter.configs').setup ({
      ensure_installed = {
        "comment",
        "css",
        "graphql",
        "html",
        "javascript",
        "json",
        "lua",
        "php",
        "tsx",
        "typescript",
        "vim",
      }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      sync_install = false,
      auto_install = true,
      autopairs = {
        enable = true,
      },
      highlight = { enable = true },
      indent = { enable = true },
      autotag = {
        enable = true,
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?",
        },
      },
    })
  end,
    keys = {
      { "<leader>hl", ":TSHighlightCapturesUnderCursor<CR>" }
    }
},
  {
"JoosepAlviste/nvim-ts-context-commentstring",
config = function()
  require('ts_context_commentstring').setup {
  enable_autocmd = false,
				languages = {
					typescript = '// %s',
				}
}
end
  }
}
