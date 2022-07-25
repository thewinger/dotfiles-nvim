-- Setup leap.nvim
local status_ok, nleap = pcall(require, "leap")
if not status_ok then
	return
end

nleap.setup()
