return {
  {
    "echasnovski/mini.files",
    version = "*",
    config = true,
    keys = {
      { "<leader>e", ":lua MiniFiles.open()<CR>", { desc = "Toggle file explorer" } }, -- toggle file explorer
    },
  },
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

    -- -- change color for arrows in tree to light blue
    -- vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
    -- vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

    -- configure nvim-tree
    nvimtree.setup({
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      renderer = {
        root_folder_modifier = ":t",
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      diagnostics = {
        enable = false,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      view = {
        width = 30,
        side = "right",
      },
    })
  end,
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" } }, -- toggle file explorer
    { "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" } }, -- toggle file explorer on current file
    { "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" } }, -- collapse file explorer
    { "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" } }, -- refresh file explorer
  },
}
