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
	palettes = {
		duskfox = {
			red = { base = "#EB6F92", bright = "#F084A3", dim = "#D84F76" },
			green = { base = "#70DBB6", bright = "#7CE9C3", dim = "#4CCDA0" },
			yellow = { base = "#FAB795", bright = "#FCC3A6", dim = "#EC9569" },
			blue = { base = "#5CC2D6", bright = "#71D2E5", dim = "#43B1C7" },
			magenta = { base = "#F28CC1", bright = "#FAA8D2", dim = "#E96DAD" },
			cyan = { base = "#7CDADA", bright = "#85E5E5", dim = "#58C6C6" },
		},
	},
	specs = {
		all = {
			syntax = {
				bracket = "white",
				-- func = "red.dim",
				keyword = "red",
				string = "yellow.bright",
			},
		},
	},
	groups = {
		all = {
			Search = { bg = "palette.green.dim" },
			IncSearch = { bg = "palette.green.dim" },
			Substitute = { bg = "palette.green.dim" },
			TSTag = { fg = "palette.red.bright" },
			TSTagDelimiter = { fg = "palette.white" },
		},
	},
	modules = {
		cmp = true,
		gitsigns = true,
		illuminate = true,
		lightspeed = true,
		native_lsp = true,
		nvimtree = true,
		telescope = true,
		treesitter = true,
	},
})

-- local palette = require("nightfox.palette").load("duskfox")

-- print(vim.inspect(palette))

vim.cmd("colorscheme duskfox")

-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
