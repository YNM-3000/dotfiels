local saga_ok, saga = pcall(require, "lspsaga")
if not saga_ok then
	return
end

saga.setup({
	-- scroll_preview = { prev = "<C-f>", next = "<C-j>" },
	lightbulb = {
		enable = false,
	},
	finder = {
		keys = {
			toggle_or_open = "<cr>",
			vsplit = "<C-o>",
		},
	},
	definition = {
		keys = {
			edit = "<cr>",
			vsplit = "<C-o>",
		},
	},
	callhierarchy = {
		keys = {
			edit = "<cr>",
			vsplit = "<C-o>",
		},
	},
	ui = {
		-- code_action = "",
	},
	rename = {
		in_select = false,
	},
})
