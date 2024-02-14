return {
	"numToStr/Comment.nvim",
	name = "comment",
	config = function()
		require("comment").setup({
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end,
}
