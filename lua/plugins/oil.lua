return {
  "stevearc/oil.nvim",
  -- opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Leave netrw on
    require("oil").setup({ default_file_explorer = false })
    -- Let oil open directories by default
    require("oil.config").setup({ default_file_explorer = true })
    -- Turn off the directory browsing part of netrw manually
    if vim.fn.exists("#FileExplorer") then
      vim.api.nvim_create_augroup("FileExplorer", { clear = true })
    end
    vim.api.nvim_create_user_command("Explore", "Oil <args>", { nargs = "?", complete = "dir" })
    vim.api.nvim_create_user_command("E", "Explore <args>", { nargs = "?", complete = "dir" })
    vim.api.nvim_create_user_command("Sexplore", "belowright split | Oil <args>", { nargs = "?", complete = "dir" })
    vim.api.nvim_create_user_command("Vexplore", "rightbelow vsplit | Oil <args>", { nargs = "?", complete = "dir" })
    vim.api.nvim_create_user_command("Texplore", "tabedit % | Oil <args>", { nargs = "?", complete = "dir" })
  end,
}
