local indent_blankline_ok, indent_blankline = pcall(require, "indent_blankline")
if not indent_blankline_ok then
	return
end

-- vim.cmd([[highlight IndentBlanklineIndent1 guifg=#ffffff gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent2 guifg=#cba6f7 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent3 guifg=#89b4fa gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent4 guifg=#a6e3a1 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent5 guifg=#f9e2af gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent6 guifg=#f38ba8 gui=nocombine]])

indent_blankline.setup({
	show_end_of_line = true,
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	-- use_treesitter = true,
	-- use_treesitter_scope = true,
	char = "▏",
	-- char_highlight_list = require("catppuccin.groups.integrations.indent_blankline").get(),
	-- char_highlight_list = {
	-- 	"IndentBlanklineIndent1",
	-- 	"IndentBlanklineIndent2",
	-- 	"IndentBlanklineIndent3",
	-- 	"IndentBlanklineIndent4",
	-- 	"IndentBlanklineIndent5",
	-- 	"IndentBlanklineIndent6",
	-- },
})
