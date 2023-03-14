local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local servers = {
	"graphql",
	"html",
	"jsonls",
	"lua_ls",
	"tailwindcss",
	"tsserver",
}

lsp_installer.setup({
	ensure_installed = servers,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("win.lsp.handlers").on_attach,
		capabilities = require("win.lsp.handlers").capabilities,
	}

	if server == "lua_ls" then
		local lua_opts = require("win.lsp.settings.lua_ls")
		opts = vim.tbl_deep_extend("force", lua_opts, opts)
	end

	if server == "tsserver" then
		local tsserver_opts = require("win.lsp.settings.tsserver")
		opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	end

	if server == "cssls" then
		local cssls_opts = require("win.lsp.settings.cssls")
		opts = vim.tbl_deep_extend("force", cssls_opts, opts)
	end
	-- if server == "jsonls" then
	--   local jsonls_opts = require "win.lsp.settings.jsonls"
	--   opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	-- end

	lspconfig[server].setup(opts)
end
