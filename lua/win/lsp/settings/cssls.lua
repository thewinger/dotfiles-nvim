return {
	cmd = { "vscode-css-language-server", "--stdio" },
	settings = {
		scss = {
			lint = {
				idSelector = "warning",
				unknownAtRules = "ignore",
			},
		},
	},
}
