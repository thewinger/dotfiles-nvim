return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.cursorword").setup()
      require("mini.icons").setup()
      require("mini.ai").setup()
      require("mini.surround").setup()
      require("mini.indentscope").setup()

      local MiniFiles = require("mini.files")
      local minifiles_toggle = function()
        if not MiniFiles.close() then
          MiniFiles.open(vim.api.nvim_buf_get_name(0))
          MiniFiles.reveal_cwd()
        end
      end

      local map_split = function(buf_id, lhs, direction)
        local rhs = function()
          -- Make new window and set it as target
          local new_target_window
          vim.api.nvim_win_call(MiniFiles.get_explorer_state().target_window, function()
            vim.cmd(direction .. " split")
            ew_target_window = vim.api.nvim_get_current_win()
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

      MiniFiles.setup({

        vim.keymap.set("n", "<leader>e", minifiles_toggle, { desc = "Explorer" }),
      })
    end,
  },
}