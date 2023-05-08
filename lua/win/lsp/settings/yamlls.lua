return {
	settings = {
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"] = "conf/**/*catalog*",
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
			},
			keyOrdering = false,
		},
	},
}
