local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

local status_ok_context, ts_context = pcall(require, "ts_context_commentstring")
if not status_ok_context then
	return
end
---@diagnostic disable: missing-fields
configs.setup({
	ensure_installed = {
		"comment",
		"css",
		"graphql",
		"html",
		"javascript",
		"json",
		"lua",
		"php",
		"tsx",
		"typescript",
		"vim",
	}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages

	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	auto_install = true,
	ignore_install = { "" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	autotag = {
		enable = true,
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
})
---@diagnostic enable: missing-fields
ts_context.setup({
	enable_autocmd = false,
})
