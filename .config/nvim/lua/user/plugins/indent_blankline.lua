local indent_blankline_ok, indent_blankline = pcall(require, "ibl")
if not indent_blankline_ok then
	return
end

local highlight = {
	"Error",
	"Constant",
	"String",
	"Function",
	"Statement",
	"Type",
	"Label",
}

vim.g.rainbow_delimiters = { highlight = highlight }

indent_blankline.setup({
	indent = {
		char = "╎",
	},
	scope = {
		char = "▏",
		highlight = highlight,
		-- priority = 500,
	},
})
