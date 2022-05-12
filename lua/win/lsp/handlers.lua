local M = {}

local util = require("vim.lsp.util")
-- TODO: backfill this to template
M.setup = function()
	local icons = require("win.icons")
	local signs = {

		{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
		{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
		{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
		{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
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

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_highlight_document(client)
	-- if client.server_capabilities.document_highlight then
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

	map(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	map(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	map(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	map(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	map(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	map(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	map(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	map(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	map(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	map(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  map(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")

	-- LSPSaga
	--[[ map(bufnr, "n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)
	map(bufnr, "n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
	map(bufnr, "n", "<leader>gl", "<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<cr>", opts)
	map(bufnr, "x", "<leader>ca", "<cmd>Lspsaga range_code_action<cr>", opts) ]]

	vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
	-- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = "rounded",
				source = "always",
				prefix = " ",
				scope = "cursor",
			}
			vim.diagnostic.open_float(nil, opts)
		end,
	})
end

local formatting_callback = function(client, bufnr)
	vim.keymap.set("n", "<leader>f", function()
		local params = util.make_formatting_params({})
		client.request("textDocument/formatting", params, nil, bufnr)
	end, { buffer = bufnr })
end

M.on_attach = function(client, bufnr)
	if client.name == "sumneko_lua" then
		client.resolved_capabilities.document_formatting = false
		-- formatting_callback(client, bufnr)
	end
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
		-- formatting_callback(client, bufnr)
	end
	if client.name == "tailwindcss" then
		require("tailwindcss-colors").buf_attach(bufnr)
	end
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

function M.enable_format_on_save()
	vim.cmd([[
    augroup format_on_save
      autocmd!
      autocmd BufWritePre * lua vim.lsp.buf.formatting()
    augroup end
  ]])
	vim.notify("Enabled format on save")
end

function M.disable_format_on_save()
	M.remove_augroup("format_on_save")
	vim.notify("Disabled format on save")
end

function M.toggle_format_on_save()
	if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
		M.enable_format_on_save()
	else
		M.disable_format_on_save()
	end
end

function M.remove_augroup(name)
	if vim.fn.exists("#" .. name) == 1 then
		vim.cmd("au! " .. name)
	end
end

vim.cmd([[ command! LspToggleAutoFormat execute 'lua require("win.lsp.handlers").toggle_format_on_save()' ]])

return M
