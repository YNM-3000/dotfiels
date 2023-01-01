local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
	return
end

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = require("user.plugins.lsp.settings.servers").servers,
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})
