-- Aliases
-- local cmd = vim.cmd
local opt = vim.opt

-- Disable netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- Appearance
opt.background = "dark"
opt.termguicolors = true
vim.g.skip_ts_context_commentstring_module = true
opt.showtabline = 1 -- Line above window with file path
opt.pumheight = 10 -- pop up menu height
opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.numberwidth = 4 -- set number column width to 2 {default 4}
opt.showmatch = true -- Show matching parents, brackets, etc.
opt.title = true -- Show title in terminal tab
opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
opt.guicursor = "n-c-sm:block,i-ci-ve:ver25,v-r-cr-o:hor20"

-- Files and Others
-- opt.fileencoding = "utf-8" -- the encoding written to a file
opt.shortmess:append("c")
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("_")

-- Split Windows
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window

-- Updates and Backups
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.backup = false -- creates a backup file
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.updatetime = 100 -- faster completion (4000ms default)
opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.swapfile = false -- creates a swapfile
opt.undofile = true -- enable persistent undo

-- clipboard
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard

-- Backspace key

-- Search
opt.hlsearch = true -- Don't highlight all matches on previous search pattern (In previous config it was false)
opt.incsearch = true -- show highlight while writing search
opt.ignorecase = true -- ignore case in search patterns
opt.smartcase = true -- smart case

-- Mouse and Scrolling
opt.scrolloff = 8 -- is one of my fav
opt.sidescroll = 1 -- Scroll sideways a  character at a time instead of a screen at a time
opt.sidescrolloff = 8
opt.mouse = "a" -- allow the mouse to be used in neovim

-- Wrapping
opt.wrap = false -- display lines as not one long line
opt.breakindent = true
opt.number = true -- set numbered lines
opt.relativenumber = true -- set relative numbered lines
opt.cursorline = true -- highlight the current line
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time

-- Tabs and Indentations
opt.tabstop = 2 -- insert 2 spaces for a tab
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.softtabstop = 2 -- number of tabs when inserting operations
opt.smartindent = true -- make indenting smarter again
opt.expandtab = true -- convert tabs to spaces
vim.g.editorconfig = false

-- Others
opt.fillchars.fold = " "
opt.fillchars.eob = " " -- To stop showing ~ at the end of buffer
