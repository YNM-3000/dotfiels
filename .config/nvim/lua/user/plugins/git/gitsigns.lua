local gitsigns_ok, gitsigns = pcall(require, "gitsigns")
if not gitsigns_ok then
	print("gitsigns_not_ok")
	return
end

local yadm_signs_ok, yadm_signs = pcall(require, "gitsigns")

gitsigns.setup({
	_on_attach_pre = function(_, callback)
		if not yadm_signs_ok then
			print("gitsigns_yadm_not_ok")
			return
		end
		require("gitsigns-yadm").yadm_signs(callback)
	end,
})
