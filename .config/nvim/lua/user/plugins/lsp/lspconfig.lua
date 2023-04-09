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

	-- set keybinds
	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<cr>", opts)
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<cr>", opts)
	keymap.set("n", "<Leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
	keymap.set("n", "<Leader>rn", "<cmd>Lspsaga rename<cr>", opts)
	keymap.set("n", "gh", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
	keymap.set("n", "gh", "<cmd>Lspsaga show_cursor_diagnostics<cr>", opts)
	keymap.set("n", "<Tab>", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
	keymap.set("n", "<S-Tab>", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
	keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
	keymap.set("n", "<F6>", "<cmd>Lspsaga outline<cr>", opts)

	if client.name == "tsserver" then
		keymap.set("n", "<Leader>rf", ":TypescriptRenameFile<cr>")
	end
end

-- used to enable autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

local servers = require("user.plugins.lsp.settings.servers")

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
