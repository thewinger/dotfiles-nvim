local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
	return
end

--[[ "cssls", ]]
--[[ "cssmodules_ls", ]]
local servers = {
	"cssls",
	"eslint",
	"graphql",
	"html",
	"jsonls",
	"yamlls",
	"lua_ls",
	"tailwindcss",
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

local opts = {
	on_attach = require("win.lsp.handlers").on_attach,
	capabilities = require("win.lsp.handlers").capabilities,
}

for _, server in pairs(servers) do
	server = vim.split(server, "@")[1]

	if server == "lua_ls" then
		local lua_opts = require("win.lsp.settings.lua_ls")
		opts = vim.tbl_deep_extend("force", lua_opts, opts)
	end

	--[[ if server == "tsserver" then ]]
	--[[ 	local tsserver_opts = require("win.lsp.settings.tsserver") ]]
	--[[ 	opts = vim.tbl_deep_extend("force", tsserver_opts, opts) ]]
	--[[ end ]]

	if server == "eslint" then
		local eslint_opts = require("win.lsp.settings.eslint")
		opts = vim.tbl_deep_extend("force", eslint_opts, opts)
	end

	if server == "yamlls" then
		local yamlls_opts = require("win.lsp.settings.yamlls")
		opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
	end

	lspconfig[server].setup(opts)
end

require("typescript").setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false, -- enable debug logging for commands
	go_to_source_definition = {
		fallback = true, -- fall back to standard LSP definition on failure
	},
	server = { -- pass options to lspconfig's setup method
		opts,
	},
})
