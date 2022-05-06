return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
				preloadFileSize = 300,
			},
			formate = {
				enable = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
