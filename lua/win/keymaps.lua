local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set
local cmd = vim.cmd

--Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Allow to use ; instead of : to start command
keymap("n", ";", ":")

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Shortcuts for opening explorer in new splits
keymap("n", "<Leader>v", ":Vex!<CR>")
keymap("n", "<Leader>s", ":Sex<CR>")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>")
keymap("n", "<C-Down>", ":resize -2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")

-- Keeping the cursor center lined when searching
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Jump to bottom of file and center last line
keymap("n", "G", "Gzz")

-- Paste on next/prev line instead of same line
keymap("n", "<Leader>p", "oq<BS><Esc>p")
keymap("n", "<Leader>P", "Oq<BS><Esc>p")

-- Delete without yanking
keymap("n", "<Leader>d", '"_d')
keymap("v", "<Leader>d", '"_d')

-- Move by visual lines, not text lines
keymap("n", "j", "gj")
keymap("n", "k", "gk")
keymap("v", "j", "gj")
keymap("v", "k", "gk")

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>")
keymap("i", "jj", "<ESC>")
keymap("i", "kj", "<ESC>")

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Moves line shortcuts (∆ = alt+j, ˚ = alt+k)
keymap("n", "∆", ":m .+1<CR>==")
keymap("n", "˚", ":m .-2<CR>==")
keymap("i", "∆", "<ESC>:m .+1<CR>==gi")
keymap("i", "˚", "<ESC>:m .-2<CR>==gi")
keymap("v", "∆", ":m '>+1<CR>gv=gv")
keymap("v", "˚", ":m '<-2<CR>gv=gv")

-- Replace currently selected text with default register without yanking it
keymap("v", "p", '"_dP')

-- vv to highlight just the text, without indents of a line
keymap("", "vv", "^vg_")

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Close current buffer without closing window
keymap("n", "<leader>q", ":bp|bd #<CR>")

-- Saving even when mistype
cmd("command! Wq wq")
cmd("command! W w")
cmd("command! Q q")
cmd("command! WQ wq")

-- You can't stop me!
keymap("c", "w!!", "<esc>:lua require'utils'.sudo_write()<CR>", { silent = true })

-- remove whitespace on save
cmd([[au BufWritePre * :%s/\s\+$//e]])

-- So we don't need to require plugins.lua
-- cmd([[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]])
-- cmd([[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]])
-- cmd([[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]])
-- cmd([[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]])
-- cmd([[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]])

-- Telescope
keymap(
	"n",
	"-",
	':lua require("telescope.builtin").find_files({ find_command = {"rg", "--files", "--hidden", "-g", "!.git" }})<CR>',
	opts
)
keymap(
	"n",
	"<leader>tw",
	'<cmd>lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>',
	opts
)
keymap("n", "<Leader>ts", '<cmd>lua require("telescope.builtin").live_grep()<CR>')
keymap("n", "<Leader>tgf", '<cmd>lua require("telescope.builtin").git_files()<CR>')
keymap("n", "<leader>tb", '<cmd>lua require("telescope.builtin").buffers()<CR>')
keymap("n", "<leader>tht", '<cmd>lua require("telescope.builtin").help_tags()<CR>')
keymap("n", "<leader>td", '<cmd>lua require("telescope.builtin").diagnostics({bufnr=0})<CR>')
keymap("n", "<leader>cs", '<cmd>lua require("telescope.builtin").colorscheme()<CR>')
keymap("n", "<Leader>tf", '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>')
keymap("n", "<leader>tms", "<cmd>Telescope tmux sessions theme=ivy<CR>")
keymap("n", "<leader>tmw", "<cmd>Telescope tmux windows theme=ivy<CR>")

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>")

-- Format Null-ls
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>")

-- ToggleTerm

-- Harpoon
keymap("n", "<leader>hh", ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
keymap("n", "<leader>ha", ':lua require("harpoon.mark").add_file()<CR>')
keymap("n", "<leader>ht", ':lua require("harpoon.mark").toggle_file()<CR>')
keymap("n", "<leader>hn", ':lua require("harpoon.ui").nav_next()<CR>')
keymap("n", "<leader>hp", ':lua require("harpoon.ui").nav_prev()<CR>')
keymap("n", "<leader>th", ':lua require("telescope").extensions.harpoon.marks{}<CR>')

-- Treesitter
keymap("n", "<leader>hl", ":TSHighlightCapturesUnderCursor<CR>")
