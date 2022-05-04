-- local colorscheme = "eclipse"
local colorscheme = "rose-pine"

require("rose-pine").setup({
	---@usage 'main'|'moon'
	dark_variant = "moon",
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = true,
	disable_float_background = false,
	disable_italics = false,
})

-- if not status_ok then
-- 	vim.notify("colorscheme " .. colorscheme .. " not found!")
-- 	return
-- end

vim.cmd("colorscheme rose-pine")
-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
