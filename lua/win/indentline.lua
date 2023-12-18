local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end
local highlight = {
	"Normal",
	"Whitespace",
}
require("ibl").setup({
	indent = { highlight = highlight, char = "" },
	whitespace = {
		highlight = highlight,
		remove_blankline_trail = false,
	},
	scope = { enabled = false },
})
