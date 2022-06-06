-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

vim.api.nvim_create_autocmd({ "User" }, {
	pattern = { "AlphaReady" },
	callback = function()
		vim.cmd([[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function()
		vim.cmd([[
    if winnr('$') == 1 && bufname() == 'NvimTreee_' . tabpagenr() | quit | endif
  ]])
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

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

-- Stay Centered
vim.api.nvim_exec(
	[[
    :function StayCenteredI()
    :  let line = line(".")
    :  if line != get(b:, 'last_line', 0)
    :    let col = getcurpos()[4]
    :    normal! zz
    :    call cursor(line, col)
    :    let b:last_line = line
    :  endif
    :endfunction
    :function StayCentered()
    :  let line = line(".")
    :  if line != get(b:, 'last_line', 0)
    :    normal! zz
    :    let b:last_line = line
    :  endif
    :endfunction
    augroup StayCentered
      autocmd!
      autocmd CursorMovedI * :call StayCenteredI()
      autocmd CursorMoved * :call StayCentered()
    augroup END
  ]],
	true
)
