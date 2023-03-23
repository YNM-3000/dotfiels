local M = {}

M.server_settings = {
	ts = {
		name = "tsserver",
	},
	html = {
		name = "html",
	},
	css = {
		name = "cssls",
	},
	tailwind = {
		name = "tailwindcss",
	},
	lua = {
		name = "lua_ls",
		settings = require("user.plugins.lsp.settings.lua_ls"),
	},
	py = {
		name = "pyright",
		settings = require("user.plugins.lsp.settings.pyright"),
	},
	json = {
		name = "jsonls",
		settings = require("user.plugins.lsp.settings.jsonls"),
	},
	go = {
		name = "gopls", -- no need to install because of vim-go but need to be included in lspconfig
	},
}

M.servers = {}
for _, server in pairs(M.server_settings) do
	table.insert(M.servers, server.name)
end

M.formatter_and_linters = {
	"prettier",
	"stylua",
	"eslint_d",
	"cspell",
}

return M
