return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-media-files.nvim",
      "camgraff/telescope-tmux.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        "danielfalk/smart-open.nvim",
        branch = "0.2.x",
        config = true,
        dependencies = {
          "kkharji/sqlite.lua",
        },
      },
    },
    config = function()
      local telescope = require("telescope")

      local actions = require("telescope.actions")
      local fb_actions = telescope.extensions.file_browser.actions

      local ivy = require("telescope.themes").get_ivy()

      telescope.setup({
        defaults = {
          layout_config = {
            vertical = { height = 0.75 },
            -- other layout configuration here
          },
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = {
            "filename_first",
            --         filename_first = {
            -- reverse_directories = true
            -- }
          },
          file_ignore_patterns = { ".git/", "node_modules" },

          mappings = {
            i = {
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,

              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,

              -- ["<C-c>"] = actions.close,

              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,

              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,

              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,

              ["<PageUp>"] = actions.results_scrolling_up,
              ["<PageDown>"] = actions.results_scrolling_down,

              ["<Tab>"] = actions.move_selection_worse,
              ["<S-Tab>"] = actions.move_selection_better,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-l>"] = actions.complete_tag,
              ["<C-/"] = actions.which_key, -- keys from pressing <C-/>
            },

            n = {
              ["<esc>"] = actions.close,
              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,

              ["<Tab>"] = actions.move_selection_worse,
              ["<S-Tab>"] = actions.move_selection_better,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

              ["j"] = actions.move_selection_next,
              ["k"] = actions.move_selection_previous,
              ["H"] = actions.move_to_top,
              ["M"] = actions.move_to_middle,
              ["L"] = actions.move_to_bottom,
              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,
              ["gg"] = actions.move_to_top,
              ["G"] = actions.move_to_bottom,

              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,

              ["<PageUp>"] = actions.results_scrolling_up,
              ["<PageDown>"] = actions.results_scrolling_down,

              ["?"] = actions.which_key,
            },
          },
        },
        pickers = {
          find_files = {
            cwd = require("lspconfig.util").root_pattern(".git")(vim.fn.expand("%:p")),
            theme = "ivy",
            layout_config = {
              height = 0.75,
            },
          },
          git_files = {
            theme = "ivy",
            layout_config = {
              height = 0.75,
            },
          },
          grep_string = {
            theme = "ivy",
            layout_config = {
              height = 0.75,
            },
          },
          live_grep = {
            theme = "ivy",
            layout_config = {
              height = 0.75,
            },
          },
          buffers = {
            show_all_buffers = true,
            sort_lastused = true,
            theme = "ivy",
            layout_config = {
              height = 0.75,
            },
            mappings = {
              i = {
                ["<c-d>"] = "delete_buffer",
              },
              n = {
                ["<c-d>"] = "delete_buffer",
              },
            },
          },
        },
        lsp_definitions = {
          file_ignore_patterns = { "%.d.ts" },
        },
        extensions = {
          file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            layout_config = {
              height = 0.75,
            },
            mappings = {
              ["n"] = {
                ["a"] = fb_actions.create,
                ["r"] = fb_actions.rename,
                ["m"] = fb_actions.move,
              },
            },
          },
          harpoon = {
            theme = "ivy",
          },
          smart_open = {
            match_algorithm = "fzf",
            theme = "ivy",
          },
          media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg", -- find command (defaults to `fd`)
          },
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
          tmux = {
            theme = "ivy",
          },
        },
      })

      telescope.load_extension("media_files")
      telescope.load_extension("fzf")
      telescope.load_extension("file_browser")
      telescope.load_extension("harpoon")
      telescope.load_extension("tmux")
      telescope.load_extension("smart_open")
    end,
    keys = {
      -- { "-", ':lua require("helpers").project_files()<CR>' },
      -- { "-", ':lua require("telescope").extensions.smart_open.smart_open(ivy)<CR>' },
      { "-", ":Telescope smart_open theme=ivy layout_config={height=0.75}<CR>" },
      { "<leader>-", ':lua require("telescope.builtin").resume()<CR>' },
      {
        "<leader>tw",
        '<cmd>lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>',
      },
      { "<leader>ts", '<cmd>lua require("telescope.builtin").live_grep()<CR>' },
      { "<leader>tg", '<cmd>lua require("telescope.builtin").git_files()<CR>' },
      { "<leader>tb", '<cmd>lua require("telescope.builtin").buffers()<CR>' },
      { "<leader>tht", '<cmd>lua require("telescope.builtin").help_tags()<CR>' },
      { "<leader>cs", '<cmd>lua require("telescope.builtin").colorscheme()<CR>' },
      { "<leader>km", '<cmd>lua require("telescope.builtin").keymaps()<CR>' },
      -- {"gd", '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>'},

      { "<Leader>tf", '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>' },
      { "<leader>tms", "<cmd>Telescope tmux sessions theme=ivy<CR>" },
      { "<leader>tmw", "<cmd>Telescope tmux windows theme=ivy<CR>" },
    },
  },
  {
    "https://github.com/d00h/telescope-any",
    config = function()
      local opts = {} -- or user
      local telescope_any = require("telescope-any").create_telescope_any(opts)
      -- vim.api.nvim_create_user_command("TelescopeAny", telescope_any, { nargs = 0 })
      vim.api.nvim_set_keymap("n", "<leader>tt", "", {
        noremap = true,
        silent = true,
        callback = telescope_any,
      })
    end,
  },
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    config = function()
      require("telescope").load_extension("smart_open")
      -- require('telescope').extensions.smart_open.smart_open {
      --   cwd_only = true,
      -- }
    end,
    dependencies = {
      "kkharji/sqlite.lua",
      -- Only required if using match_algorithm fzf
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  },
}
