local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local cmd = vim.cmd

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
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
keymap("n", ";", ":", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Shortcuts for opening explorer in new splits
keymap("n", "<Leader>v", ":Vex!<CR>", opts)
keymap("n", "<Leader>s", ":Sex<CR>", opts)
-- keymap('n', '<Leader>e', ':Lex 30<CR>', opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<C-N>", ":bnext<CR>", opts)
keymap("n", "<C-P>", ":bprevious<CR>", opts)

-- Keeping the cursor center lined when searching
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Jump to bottom of file and center last line
keymap("n", "G", "Gzz", opts)

-- Paste on next/prev line instead of same line
keymap("n", "<Leader>p", "oq<BS><Esc>p", opts)
keymap("n", "<Leader>P", "Oq<BS><Esc>p", opts)

-- Delete without yanking
keymap("n", "<Leader>d", '"_d', opts)
keymap("v", "<Leader>d", '"_d', opts)

-- Move by visual lines, not text lines
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("v", "j", "gj", opts)
keymap("v", "k", "gk", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "jj", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Moves line shortcuts (∆ = alt+j, ˚ = alt+k)
keymap("n", "∆", ":m .+1<CR>==", opts)
keymap("n", "˚", ":m .-2<CR>==", opts)
keymap("i", "∆", "<ESC>:m .+1<CR>==gi", opts)
keymap("i", "˚", "<ESC>:m .-2<CR>==gi", opts)
keymap("v", "∆", ":m '>+1<CR>gv=gv", opts)
keymap("v", "˚", ":m '<-2<CR>gv=gv", opts)

-- Replace currently selected text with default register without yanking it
keymap("v", "p", '"_dP', opts)

-- vv to highlight just the text, without indents of a line
keymap("", "vv", "^vg_", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

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
cmd([[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]])
cmd([[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]])
cmd([[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]])
cmd([[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]])
cmd([[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]])

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
keymap("n", "<Leader>ts", '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts)
keymap("n", "<Leader>tf", '<cmd>lua require("telescope.builtin").git_files()<CR>', opts)
keymap("n", "<leader>tb", '<cmd>lua require("telescope.builtin").buffers()<CR>', opts)
keymap("n", "<leader>tht", '<cmd>lua require("telescope.builtin").help_tags()<CR>', opts)
keymap("n", "<leader>td", '<cmd>lua require("telescope.builtin").diagnostics({bufnr=0})<CR>', opts)
-- keymap("n", "<Leader>tf", '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>', opts)
keymap("n", "<leader>tms", "<cmd>Telescope tmux sessions theme=ivy<CR>", opts)
keymap("n", "<leader>tmw", "<cmd>Telescope tmux windows theme=ivy<CR>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Format Null-ls
keymap("n", "<leader>f", ":Format<cr>", opts)

-- ToggleTerm
keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()CR", opts)

-- Harpoon
keymap("n", "<leader>hh", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
keymap("n", "<leader>ha", ':lua require("harpoon.mark").add_file()<CR>', opts)
keymap("n", "<leader>hn", ':lua require("harpoon.ui").nav_next()<CR>', opts)
keymap("n", "<leader>hp", ':lua require("harpoon.ui").nav_prev()<CR>', opts)
keymap("n", "<leader>th", ':lua require("telescope").extensions.harpoon.marks{}<CR>', opts)
