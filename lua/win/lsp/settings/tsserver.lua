local function filter(arr, fn)
	if type(arr) ~= "table" then
		return arr
	end

	local filtered = {}
	for k, v in pairs(arr) do
		if fn(v, k, arr) then
			table.insert(filtered, v)
		end
	end

	return filtered
end

local function filterReactDTS(value)
	return string.match(value.uri, "%.d.ts") == nil
end

return {
	settings = {
		completions = {
			completeFunctionCalls = true,
		},
	},
	handlers = {
		["textDocument/definition"] = function(_, result, params)
			local util = require("vim.lsp.util")
			if result == nil or vim.tbl_isempty(result) then
				-- local _ = vim.lsp.log.info() and vim.lsp.log.info(params.method, "No location found")
				return nil
			end

			if vim.tbl_islist(result) then
				-- this is opens a buffer to that result
				-- you could loop the result and choose what you want
				util.jump_to_location(result[1], "utf-8")

				if #result > 1 then
					local isReactDTs = false
					---@diagnostic disable-next-line: unused-local
					for key, value in pairs(result) do
						if string.match(value.targetUri, "react/index.d.ts") then
							isReactDTs = true
							break
						end
					end
					if not isReactDTs then
						-- this sets the value for the quickfix list
						util.set_qflist(util.locations_to_items(result))
						-- this opens the quickfix window
						vim.api.nvim_command("copen")
						vim.api.nvim_command("wincmd p")
					end
				end
			else
				util.jump_to_location(result)
			end
		end,
	},
}
