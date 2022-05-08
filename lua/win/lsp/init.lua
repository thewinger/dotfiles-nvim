local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("win.lsp.configs")
require("win.lsp.handlers").setup()
require("win.lsp.null-ls")
