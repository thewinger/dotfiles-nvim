-- local colorscheme = "eclipse"

-- if not status_ok then
-- 	vim.notify("colorscheme " .. colorscheme .. " not found!")
-- 	return
-- end

require("rose-pine").setup({
	---@usage 'main'|'moon'
	dark_variant = "moon",
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = true,
	disable_float_background = false,
	disable_italics = false,
})

require("nightfox").setup({
	options = {
		transparent = true,
	},
	specs = {
		all = {
			syntax = {
				string = "#fab795",
			},
		},
	},
	modules = {
		cmp = true,
		gitsigns = true,
		illuminate = true,
		lightspeed = true,
		nvimtree = true,
		telescope = true,
		treesitter = true,
	},
})

-- local palette = require("nightfox.palette").load("duskfox")

-- print(vim.inspect(palette))

vim.cmd("colorscheme duskfox")

-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
