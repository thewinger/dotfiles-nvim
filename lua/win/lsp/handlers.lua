local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- virtual_lines = false,
		virtual_text = false,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "if_many",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_highlight_document(client)
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
	-- end
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local map = vim.api.nvim_buf_set_keymap

	map(bufnr, "n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
	map(bufnr, "n", "<Leader>gd", ":lua vim.lsp.buf.definition()<CR>", opts)
	map(bufnr, "n", "gd", ":TypescriptGoToSourceDefinition<CR>", opts)
	map(bufnr, "n", "gdv", ":vsplit | lua vim.lsp.buf.definition()<CR>", opts)
	map(bufnr, "n", "gdh", ":split | lua vim.lsp.buf.definition()<CR>", opts)
	map(bufnr, "n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
	map(bufnr, "n", "gI", ":lua vim.lsp.buf.implementation()<CR>", opts)
	-- map(bufnr, "n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", opts)
	map(bufnr, "n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
	map(bufnr, "n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
	map(bufnr, "n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
	map(bufnr, "n", "[d", ':lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	map(bufnr, "n", "]d", ':lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	map(bufnr, "n", "gl", ":lua vim.diagnostic.open_float()<CR>", opts)
	-- map(bufnr, "n", "<leader>q", ":lua vim.diagnostic.setloclist()<CR>", opts)
	vim.cmd([[ command! Format execute 'lua.vim.lsp.buf.format( { async = true})' ]])
	-- map(bufnr, "n", "<leader>f", ":lua vim.lsp.buf.formatting()<CR>", opts)
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)

	if client.name == "lua_ls" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "html" then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end

	--[[ if client.name == "eslint" then ]]
	--[[ 	client.server_capabilities.documentFormattingProvider = false ]]
	--[[ 	client.server_capabilities.documentRangeFormattingProvider = false ]]
	--[[ end ]]

	if client.name == "tailwindcss" then
		require("tailwindcss-colors").buf_attach(bufnr)
	end
end
return M
