return {
	settings = {
		completions = {
			completeFunctionCalls = true,
		},
	},
	handlers = {
		-- pick the first response to a go to definition response. that way we go straight to the
		-- source definition without needing to choose from the type definition .d.ts file
		["textDocument/definition"] = function(err, result, ...)
			result = vim.tbl_islist(result) and result[1] or result
			vim.lsp.handlers["textDocument/definition"](err, result, ...)
		end,
	},
}
