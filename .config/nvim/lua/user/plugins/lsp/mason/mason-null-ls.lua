local mason_null_ls_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_ok then
	return
end

local formatter_and_linters = {
	"google-java-format",
	"prettier",
	"stylua",
	"eslint_d",
	"cspell",
}

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = require("user.plugins.lsp.settings").formatter_and_linters,
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
