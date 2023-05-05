return {
	settings = {
		validProperties = {},
		format = false,
		codeAction = {
			showDocumentation = { enable = false },
			disableRuleComment = { enable = false },
		},
	},
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
}
