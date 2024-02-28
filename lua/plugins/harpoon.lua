return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("harpoon").setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    })
  end,
  keys = {
    { "<leader>ha", "function() harpoon:list():append()" },
    { "<leader>hh", "function() harpoon.ui:toggle_quick_menu(harpoon:list())" },
    { "<leader>h1", "function() harpoon:list():select(1)" },
    { "<leader>h2", "function() harpoon:list():select(2)" },
    { "<leader>h3", "function() harpoon:list():select(3)" },
    { "<leader>h4", "function() harpoon:list():select(4)" },
  },
}
