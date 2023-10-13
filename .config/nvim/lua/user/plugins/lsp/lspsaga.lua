local saga_ok, saga = pcall(require, "lspsaga")
if not saga_ok then
	return
end

saga.setup({
	-- scroll_preview = { prev = "<C-f>", next = "<C-j>" },
	finder = {
		keys = {
			toggle_or_open = "<CR>",
			vsplit = "\\",
		},
	},
	definition = {
		keys = {
			edit = "<CR>",
			vsplit = "\\",
		},
	},
})
