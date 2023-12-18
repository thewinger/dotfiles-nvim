-- Aliases
-- local cmd = vim.cmd
local opt = vim.opt

-- :help options
opt.backup = false -- creates a backup file
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.fileencoding = "utf-8" -- the encoding written to a file
-- opt.foldcolumn = "1"
-- opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- opt.foldlevelstart = -1
-- opt.foldenable = true
opt.fillchars.fold = " "
opt.fillchars.eob = " " -- To stop showing ~ at the end of buffer
opt.hlsearch = false -- Don't highlight all matches on previous search pattern (In previous config it was false)
opt.incsearch = true -- show highlight while writing search
opt.ignorecase = true -- ignore case in search patterns
-- opt.laststatus = 3 -- Only one status line for all splits
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.pumheight = 10 -- pop up menu height
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.smartcase = true -- smart case
opt.smartindent = true -- make indenting smarter again
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = false -- creates a swapfile
opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true -- enable persistent undo
opt.updatetime = 300 -- faster completion (4000ms default)
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.tabstop = 2 -- insert 2 spaces for a tab
opt.softtabstop = 2 -- number of tabs when inserting operations
opt.cursorline = true -- highlight the current line
opt.number = true -- set numbered lines
opt.relativenumber = true -- set relative numbered lines
opt.numberwidth = 4 -- set number column width to 2 {default 4}
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.wrap = false -- display lines as not one long line
opt.scrolloff = 8 -- is one of my fav
opt.sidescroll = 1 -- Scroll sideways a  character at a time instead of a screen at a time
opt.sidescrolloff = 8
opt.showmatch = true -- Show matching parents, brackets, etc.
opt.title = true -- Show title in terminal tab
opt.guifont = "monospace:h17" -- the font used in graphical neovim applications

opt.shortmess:append("c")
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("_")

-- SYNTAX AND COLOR CONFIGURATIONS
opt.termguicolors = true
opt.background = "dark"
vim.g.skip_ts_context_commentstring_module = true
