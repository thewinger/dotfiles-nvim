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

-- set qflist and open
local function qf_populate(lines, mode)
	if mode == nil or type(mode) == "table" then
		lines = core.foreach(lines, function(item)
			return { filename = item, lnum = 1, col = 1, text = item }
		end)
		mode = "r"
	end

	vim.fn.setqflist(lines, mode)

	vim.cmd([[
        belowright cwindow
        wincmd p
    ]])
end

-- populate qf list with changes (if multiple files modified)
-- NOTE(vir): now using nvim-notify
local function qf_rename()
	local notify = require("notify")
	local position_params = vim.lsp.util.make_position_params()
	position_params.oldName = vim.fn.expand("<cword>")

	vim.ui.input({ prompt = "Rename To> ", default = position_params.oldName }, function(input)
		if input == nil then
			notify("[lsp] aborted rename", "warn", { render = "minimal" })
			return
		end

		position_params.newName = input
		vim.lsp.buf_request(0, "textDocument/rename", position_params, function(err, result, ...)
			if not result or not result.changes then
				notify(string.format("could not perform rename"), "error", {
					title = string.format("[lsp] rename: %s -> %s", position_params.oldName, position_params.newName),
					timeout = 500,
				})
				return
			end

			vim.lsp.handlers["textDocument/rename"](err, result, ...)

			local notification, entries = "", {}
			local num_files, num_updates = 0, 0
			for uri, edits in pairs(result.changes) do
				num_files = num_files + 1
				local bufnr = vim.uri_to_bufnr(uri)

				for _, edit in ipairs(edits) do
					local start_line = edit.range.start.line + 1
					local line = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, start_line, false)[1]

					num_updates = num_updates + 1
					table.insert(entries, {
						bufnr = bufnr,
						lnum = start_line,
						col = edit.range.start.character + 1,
						text = line,
					})
				end

				local short_uri = string.sub(vim.uri_to_fname(uri), #vim.fn.getcwd() + 2)
				notification = notification .. string.format("made %d change(s) in %s", #edits, short_uri)
			end

			notify(notification, "info", {
				title = string.format("[lsp] rename: %s -> %s", position_params.oldName, position_params.newName),
				timeout = 2500,
			})

			if num_files > 1 then
				qf_populate(entries, "r")
			end
		end)
	end)
end
vim.lsp.buf.rename = qf_rename

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local map = vim.api.nvim_buf_set_keymap

	map(bufnr, "n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
	map(bufnr, "n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
	map(bufnr, "n", "gdv", ":vsplit | lua vim.lsp.buf.definition()<CR>", opts)
	map(bufnr, "n", "gdh", ":split | lua vim.lsp.buf.definition()<CR>", opts)
	map(bufnr, "n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
	map(bufnr, "n", "gI", ":lua vim.lsp.buf.implementation()<CR>", opts)
	-- map(bufnr, "n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", opts)
	map(bufnr, "n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
	map(bufnr, "n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
	map(bufnr, "n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
	-- map(bufnr, "n", "[d", ':lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	-- map(bufnr, "n", "]d", ':lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
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
	if client.name == "tailwindcss" then
		require("tailwindcss-colors").buf_attach(bufnr)
	end
end
return M
