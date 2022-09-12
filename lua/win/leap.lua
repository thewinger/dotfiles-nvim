-- Setup leap.nvim
local status_ok, nleap = pcall(require, "leap")
if not status_ok then
	return
end

nleap.setup({
	safe_labels = {},
})
nleap.set_default_keymaps()
vim.api.nvim_set_hl(0, "LeapBackdrop", { fg = "#707070" })
