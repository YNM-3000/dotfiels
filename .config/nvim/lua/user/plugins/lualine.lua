local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
	return
end

local lualine_nightfly = require("lualine.themes.nightfly")

local new_colors = {
	blue = "#89B4FA",
	green = "#A6E3A1",
	violet = "#F38BA8",
	yellow = "#F9E2AF",
	black = "#000000",
}

lualine_nightfly.normal.a.bg = new_colors.blue
lualine_nightfly.insert.a.bg = new_colors.green
lualine_nightfly.visual.a.bg = new_colors.violet
lualine_nightfly.command = {
	a = {
		gui = "bold",
		bg = new_colors.yellow,
		fg = new_colors.black,
	},
}

lualine.setup({
	options = {
		theme = "catppuccin",
	},
})
