local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	return
end

local SETTINGS = {
	ui = {
		icons = {
			package_installed = "ﱣ",
			package_pending = "",
			package_uninstalled = "ﱤ",
		},
	},
}

mason.setup(SETTINGS)
