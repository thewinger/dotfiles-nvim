local typescript_status_ok, typescript = pcall(require, "typescript-tools")
if not typescript_status_ok then
	return
end
typescript.setup({})
