local colorizer_ok, colorizer = pcall(require, "colorizer")
if not colorizer_ok then
	return
end

-- see more config at: https://github.com/norcalli/nvim-colorizer.lua#customization
colorizer.setup()
