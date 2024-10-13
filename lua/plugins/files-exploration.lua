return {
  {
    "echasnovski/mini.files",
    version = false,
    dependencies = {
      {
        "echasnovski/mini.icons",
        version = false,
        config = function()
          require("mini.icons").setup()
        end,
      },
    },
    opts = {
      mappings = {
        go_in = "L",
        go_in_plus = "l",
        close = "<ESC>",
      },
    },
    config = function(_, opts)
      local MiniFiles = require("mini.files")
      MiniFiles.setup(opts)
      ---@diagnostic disable:unused-vararg
      local minifiles_toggle = function(...)
        if not MiniFiles.close() then
          MiniFiles.open(vim.api.nvim_buf_get_name(0))
          MiniFiles.reveal_cwd()
        end
      end
      vim.keymap.set("n", "<leader>e", minifiles_toggle, { desc = "Explorer" })

      local map_split = function(buf_id, lhs, direction)
        local rhs = function()
          -- Make new window and set it as target
          local new_target_window
          vim.api.nvim_win_call(MiniFiles.get_explorer_state().target_window, function()
            vim.cmd(direction .. " split")
            new_target_window = vim.api.nvim_get_current_win()
          end)

          MiniFiles.set_target_window(new_target_window)
          MiniFiles.go_in()
          MiniFiles.close()
        end

        -- Adding `desc` will result into `show_help` entries
        local desc = "Split " .. direction
        vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id
          -- Tweak keys to your liking
          map_split(buf_id, "<C-x>", "belowright horizontal")
          map_split(buf_id, "<C-v>", "belowright vertical")
        end,
      })
    end,
  },
}
