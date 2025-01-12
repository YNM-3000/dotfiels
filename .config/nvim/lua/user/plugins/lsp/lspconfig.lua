local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
	return
end

local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_ok then
	return
end

local lsp_signature_ok, lsp_signature = pcall(require, "lsp_signature")
if not lsp_signature_ok then
	return
end

local inlayhints_ok, inlayhints = pcall(require, "lsp-inlayhints")
if not inlayhints_ok then
	print("inlayhints not ok")
	return
end

lsp_signature.setup({
	fix_pos = true, -- set to true, the floating window will not auto-close until finish all parameters
})

local keymap = vim.keymap

-- enable keybinds for avilable lsp server
local on_attach = function(client, bufnr)
	lsp_signature.on_attach({
		bind = true,
		border = "rounded",
	})
	local opts = { noremap = true, silent = true, buffer = bufnr }

	if client.name == "tsserver" then
		keymap.set("n", "<Leader>rf", ":TypescriptRenameFile<cr>")
	end
	if client.name == "rust_analyzer" then
		inlayhints.on_attach({ client, bufnr })
	end
end

-- used to enable autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Tell the server the capability of foldingRange,
-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
--  see: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local servers = require("user.plugins.lsp.settings")

for _, server in pairs(servers.server_settings) do
	local settings = {
		capabilities = capabilities,
		on_attach = on_attach,
	}
	if not server.settings == nil then
		settings = vim.tbl_deep_extend("force", settings, server.settings)
	end
	lspconfig[server.name].setup(settings)
end

local function setup_diags()
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		float = {
			source = "if_many",
		},
		signs = { "e", "w", "h", "i" },
		-- signs = true,
		-- update_in_insert = false,
		-- underline = true,
	})
end

setup_diags()
