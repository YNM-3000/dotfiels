local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
	return
end

lualine.setup({
	options = {
		theme = "catppuccin",
		component_separators = { left = "\\", right = "/" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "NvimTree", "undotree", "startify", "sagaoutline" },
		globalstatus = true,
		always_divide_middle = true,
	},
})
