-- local colorscheme = "nightfox"
local colorscheme = "catppuccin"

local colorscheme_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not colorscheme_ok then
	vim.notify("Colorscheme " .. colorscheme .. " not found!")
	return
end
