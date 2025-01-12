local gitsigns_ok, gitsigns = pcall(require, "gitsigns")
if not gitsigns_ok then
	print("gitsigns_not_ok")
	return
end

gitsigns.setup()
