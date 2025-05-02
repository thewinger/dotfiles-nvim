-- Remove statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = { "AlphaReady" },
  callback = function()
    vim.cmd([[
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]])
  end,
})

-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
  callback = function()
    vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
  end,
})

-- show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.cmd([[
      hi link illuminatedWord LspReferenceText
      hi! Normal ctermbg=NONE guibg=NONE
      hi! Nontext ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
      hi Comment cterm=italic gui=italic
      hi htmlArg cterm=italic gui=italic
      hi CursorLine cterm=none ctermbg=234 ctermfg=none
    ]])
  end,
})

-- Stay Centered
-- Stay Centered functions
local function stay_centered_insert()
  local line = vim.fn.line(".")
  local last_line = vim.b.last_line or 0

  if line ~= last_line then
    local col = vim.fn.getcurpos()[4]
    vim.cmd("normal! zz")
    vim.fn.cursor(line, col)
    vim.b.last_line = line
  end
end

local function stay_centered()
  local line = vim.fn.line(".")
  local last_line = vim.b.last_line or 0

  if line ~= last_line then
    vim.cmd("normal! zz")
    vim.b.last_line = line
  end
end

-- Stay Centered autocommands
local stay_centered_group = vim.api.nvim_create_augroup("StayCentered", { clear = true })
vim.api.nvim_create_autocmd("CursorMovedI", {
  group = stay_centered_group,
  callback = stay_centered_insert,
})
vim.api.nvim_create_autocmd("CursorMoved", {
  group = stay_centered_group,
  callback = stay_centered,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- vim.api.nvim_create_autocmd({ "CursorHold,CursorHoldI" }, {
--	callback = function()
--		vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
--	end,
-- })

-- Function to check if a floating dialog exists and if not
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = "*",
  callback = function()
    for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
      if vim.api.nvim_win_get_config(winid).zindex then
        return
      end
    end
    vim.diagnostic.open_float({
      scope = "cursor",
      focusable = false,
      close_events = {
        "CursorMoved",
        "CursorMovedI",
        "BufHidden",
        "InsertCharPre",
        "WinLeave",
      },
    })
  end,
}) -- then check for diagnostics under the cursor

-- Overwrite highlight groups in any colorscheme
-- vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
--   group = vim.api.nvim_create_augroup("Color", {}),
--   pattern = "*",
--   callback = function()
--     local comment = "#71717a"
--
--     local hl = vim.api.nvim_set_hl
--
--     -- hl(0, "String", { fg = foreground })
--     -- hl(0, "Normal", { bg = "none" })
--     -- hl(0, "NormalFloat", { bg = "none" })
--     --
--     -- hl(0, "SignColumn", { fg = "NONE", bg = "none" })
--     -- hl(0, "Comment", { fg = comment, italic = true })
--     -- hl(0, "CursorLine", { bg = dark })
--     -- hl(0, "WhiteSpace", { fg = dark, bg = base10 })
--     -- hl(0, "Visual", { link = "IncSearch" })
--     -- hl(0, "@function", { bold = false })
--     -- hl(0, "CursorLine", { fg = "NONE", bg = dark })
--     -- hl(0, "CursorLineNr", { fg = gray_light, bg = "NONE", bold = true })
--     -- hl(0, "LineNr", { fg = comment, bg = "NONE" })
--   end,
-- })
