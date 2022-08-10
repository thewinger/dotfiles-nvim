local M = {}

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
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	-- 	border = "rounded",
	-- })
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local map = vim.api.nvim_buf_set_keymap

	map(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	map(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- map(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	map(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	map(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	map(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- map(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	-- map(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	map(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	-- map(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	vim.cmd([[ command! Format execute 'lua.vim.lsp.buf.format( { async = true})' ]])
	-- map(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

M.on_attach = function(client, bufnr)
	local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if not status_cmp_ok then
		return
	end

	if client.name == "sumneko_lua" then
		-- client.server_capabilities.document_formatting = false
		client.resolved_capabilities.document_formatting = false
	end
	if client.name == "tsserver" then
		-- client.server_capabilities.document_formatting = false
		client.resolved_capabilities.document_formatting = false
	end
	if client.name == "tailwindcss" then
		require("tailwindcss-colors").buf_attach(bufnr)
	end

	M.capabilities = vim.lsp.protocol.make_client_capabilities()
	M.capabilities.textDocument.completion.completionItem.snippetSupport = true

	--[[ -- Nvim-ufo config
	M.capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	} ]]
	M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

	lsp_keymaps(bufnr)
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

-- function M.enable_format_on_save()
-- 	vim.cmd([[
--     augroup format_on_save
--       autocmd!
--       autocmd BufWritePre * lua vim.lsp.buf.formatting()
--     augroup end
--   ]])
-- 	vim.notify("Enabled format on save")
-- end
--
-- function M.disable_format_on_save()
-- 	M.remove_augroup("format_on_save")
-- 	vim.notify("Disabled format on save")
-- end
--
-- function M.toggle_format_on_save()
-- 	if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
-- 		M.enable_format_on_save()
-- 	else
-- 		M.disable_format_on_save()
-- 	end
-- end
--
-- function M.remove_augroup(name)
-- 	if vim.fn.exists("#" .. name) == 1 then
-- 		vim.cmd("au! " .. name)
-- 	end
-- end
--
-- vim.cmd([[ command! LspToggleAutoFormat execute 'lua require("win.lsp.handlers").toggle_format_on_save()' ]])

return M
