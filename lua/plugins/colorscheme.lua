return {
  {
    dir = "~/Developer/Base2Tone-nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme("base2tone_tailwind_dark")
    end,
  },
}
