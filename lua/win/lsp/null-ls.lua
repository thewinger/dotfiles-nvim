local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(buffer)
	vim.lsp.buf.format({
		-- By default, ignore any formatters provider by other LSPs
		-- (such as those managed via lspconfig or mason)
		-- Also "eslint as a formatter" doesn't work :(
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = buffer,
	})
end

local on_attach = function(client, buffer)
	-- the Buffer will be null in buffers like nvim-tree or new unsaved files
	if not buffer then
		return
	end

	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = buffer })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = buffer,
			callback = function()
				lsp_formatting(buffer)
			end,
		})
	end
end

null_ls.setup({
	debug = true,
	sources = {
		-- Prettier, but faster (daemonized)
		formatting.prettierd,
		formatting.stylua,
		formatting.black,
		null_ls.builtins.diagnostics.tsc,
		--[[ require("typescript.extensions.null-ls.code-actions"), ]]
	},
	on_attach = on_attach,
})
