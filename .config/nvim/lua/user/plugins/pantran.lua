local pantran_ok, pantran = pcall(require, "pantran")
if not pantran_ok then
	return
end

pantran.setup()
