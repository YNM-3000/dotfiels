require("user.plugins.catppuccin")
require("user.plugins.colorizer")
require("user.plugins.comment")
require("user.plugins.todo-comments")
require("user.plugins.nvim-tree")
require("user.plugins.lualine")
require("user.plugins.telescope")
require("user.plugins.nvim-cmp")
require("user.plugins.treesitter")
require("user.plugins.trouble")
-- require("user.plugins.toggleterm")
-- arround way to set indicator color of bufferline
-- vim.cmd([[highlight TablineSel cterm=underline,bold,underdouble gui=underline,bold,underdouble guibg=#f38ba8]])
vim.api.nvim_set_hl(0, "TablineSel", {
	bg = "#f38ba8",
})
-- vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
-- 	undercurl = true,
-- 	sp = "#f38ba8",
-- })
-- vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
-- 	undercurl = true,
-- 	sp = "#f9e2af",
-- })
-- vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", {
-- 	undercurl = true,
-- 	sp = "#89dceb",
-- })
-- vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {
-- 	undercurl = true,
-- 	sp = "#94e2d5",
-- })
require("user.plugins.bufferline")
require("user.plugins.indent_blankline")
require("user.plugins.leap")
require("user.plugins.lsp")
require("user.plugins.git")
require("user.plugins.autopairs")
require("user.plugins.neural")
