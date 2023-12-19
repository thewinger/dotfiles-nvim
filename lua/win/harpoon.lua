local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
	return
end

-- REQUIRED
harpoon:setup({
	settings = {
		save_on_toggle = true,
	},
})
-- REQUIRED

vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():append()
end)
vim.keymap.set("n", "<leader>hh", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
