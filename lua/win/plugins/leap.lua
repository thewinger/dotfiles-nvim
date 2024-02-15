return {
  "ggandor/leap.nvim",
  config = function()
    -- require('leap').create_default_mappings()
  end,
  keys = {
    { "s", "<Plug>(leap-forward)" },
    { "S", "<Plug>(leap-backward)" },
  },
}
