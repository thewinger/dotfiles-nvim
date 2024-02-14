return {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
      require('Comment').setup {
        pre_hook = function()
          return vim.bo.commentstring
        end,
      }
    end,
  }
