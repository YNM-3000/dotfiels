local conflict_ok, conflict = pcall(require, "conflict")
if not conflict_ok then
	return
end

conflict.setup()
