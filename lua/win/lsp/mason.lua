local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
	return
end

local servers = {
	"cssls",
	"cssmodules_ls",
	"graphql",
	"html",
	"jsonls",
	"lua_ls",
	"tailwindcss",
	"tsserver",
}

local settings = {
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
}

mason.setup(settings)
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
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

	server = vim.split(server, "@")[1]

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
