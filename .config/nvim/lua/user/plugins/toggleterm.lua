local toggleterm_ok, toggleterm = pcall(require, "toggleterm")
if not toggleterm_ok then
	return
end

toggleterm.setup()
