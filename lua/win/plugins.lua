local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	-- use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "lewis6991/impatient.nvim" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "goolord/alpha-nvim" })
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/toggleterm.nvim" })
	use({ "abecodes/tabout.nvim", wants = { "nvim-treesitter" }, after = { "nvim-cmp" } })
	use({ "stevearc/dressing.nvim", requires = "MunifTanjim/nui.nvim" })
	use({ "nacro90/numb.nvim" })
	use({ "numToStr/Comment.nvim" })
	-- use({
	-- 	"kevinhwang91/nvim-ufo",
	-- 	requires = "kevinhwang91/promise-async",
	-- })

	-- use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlightplug
	use({ "ggandor/leap.nvim" })
	use({
		"ur4ltz/surround.nvim",
		config = function()
			require("surround").setup({ mappings_style = "sandwich" })
		end,
	})
	use({ "ThePrimeagen/harpoon" })

	-- Styling
	use({ "lukas-reineke/indent-blankline.nvim" }) -- adds indentation guides to all lines

	use({ "thewinger/tailscheme.nvim" })
	use({ "EdenEast/nightfox.nvim" })
	use({ "norcalli/nvim-colorizer.lua" }) -- A high-performance color highlighter for Neovim which has no external dependencies!
	use({
		"themaxmarchuk/tailwindcss-colors.nvim",
		-- load only on require("tailwindcss-colors")
		module = "tailwindcss-colors",
		-- run the setup function after plugin is loaded
		config = function()
			-- pass config options here (or nothing to use defaults)
			require("tailwindcss-colors").setup()
		end,
	}) -- This plugin highlights Tailwind CSS class names

	-- CMP plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-nvim-lsp-signature-help" })

	-- Snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use({ "RRethy/vim-illuminate" })
	--[[ use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	}) ]]

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-media-files.nvim" })
	use({ "nvim-telescope/telescope-fzy-native.nvim" })
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "camgraff/telescope-tmux.nvim" })
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "windwp/nvim-ts-autotag" }) -- Automatically add paring tag
	use({ "nvim-treesitter/nvim-treesitter-context" })
	use({ "nvim-treesitter/playground" })

	-- Git
	use({ "dinhhuy258/git.nvim" })
	use({ "lewis6991/gitsigns.nvim" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
