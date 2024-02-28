local M = {}

M.project_files = function()
  local opts = { show_untracked = true } -- define here if you want to define something
  local ok = pcall(require("telescope.builtin").git_files, opts)
  if not ok then
    require("telescope.builtin").find_files(opts)
  end
end

M.load_highlight = function(group)
  for hl, col in pairs(group) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

return M
