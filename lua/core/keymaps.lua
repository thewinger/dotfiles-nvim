-- Shorten function name
local keymap = vim.keymap.set
local cmd = vim.cmd

--Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Allow to use ; instead of : to start command
keymap("n", ";", ":")

-- Disable command history keymap
keymap("n", "q:", "<nop>")

-- Better window navigation
keymap("n", "<C-h>", ":wincmd h<CR>")
keymap("n", "<C-j>", ":wincmd j<CR>")
keymap("n", "<C-k>", ":wincmd k<CR>")
keymap("n", "<C-l>", ":wincmd l<CR>")

-- Shortcuts for opening explorer in new splits
keymap("n", "<Leader>v", ":Vex!<CR>")
keymap("n", "<Leader>s", ":Sex<CR>")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>")
keymap("n", "<C-Down>", ":resize -2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers - Removed in favor of harpoon
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")
keymap("n", "<leader>bb", "<c-^><cr>")

-- Keeping the cursor center lined when searching
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Jump to bottom of file and center last line
keymap("n", "G", "Gzz")

keymap("n", "gh", "^")
keymap("n", "gl", "$")

-- Replace currently selected text with default register without yanking it
keymap("v", "p", '"_dP')
-- Paste on next/prev line instead of same line
keymap("n", "<Leader>p", "oq<BS><Esc>p")
keymap("n", "<Leader>P", "Oq<BS><Esc>p")

-- Paste without yanking
-- keymap("x", "<leader>p", '"_dP')

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
keymap("n", "<A-down>", ":m .+1<CR>==")
keymap("n", "<A-up>", ":m .-2<CR>==")
keymap("n", "<A-down>", ":m .+1<CR>==")
keymap("n", "<A-up>", ":m .-2<CR>==")
keymap("i", "<A-down", "<ESC>:m .+1<CR>==gi")
keymap("i", "<A-up>", "<ESC>:m .-2<CR>==gi")
keymap("v", "<A-down>", ":m '>+1<CR>gv=gv")
keymap("v", "<A-up>", ":m '<-2<CR>gv=gv")

-- vv to highlight just the text, without indents of a line
keymap("", "vv", "^vg_")

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

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

--LSP lines
-- keymap("", "<leader>ll", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

-- Ufo
vim.keymap.set("n", "zR", ':lua require("ufo").openAllFolds')
vim.keymap.set("n", "zM", ':lua require("ufo").closeAllFolds')

keymap("n", "<leader>h", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)
