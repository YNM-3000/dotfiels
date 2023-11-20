local indent_blankline_ok, indent_blankline = pcall(require, "ibl")
if not indent_blankline_ok then
	return
end

indent_blankline.setup({
	indent = {
		char = "╎",
	},
	scope = {
		char = "▏",
		highlight = { "Error", "Constant", "DiagnosticOk", "Function", "Statement", "Type", "Label" },
		-- priority = 500,
	},
})
