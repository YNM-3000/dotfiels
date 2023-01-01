local mason_null_ls_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_ok then
	return
end

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = require("user.plugins.lsp.settings.servers").formatter_and_linters,
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
