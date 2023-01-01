local catppucin_ok, catppucin = pcall(require, "catppucin")
if not catppucin_ok then
	return
end

catppucin.setup({
	-- custom_highlights = function(color)
	-- 	return {
	-- 		TabLineSel = {
	-- 			bg = color.red,
	-- 		},
	-- 		DiagnosticUnderlineError = {
	-- 			undercurl = true,
	-- 		},
	-- 		DiagnosticUnderlineWarn = {
	-- 			undercurl = true,
	-- 		},
	-- 		DiagnosticUnderlineHint = {
	-- 			undercurl = true,
	-- 		},
	-- 		DiagnosticUnderlineInfo = {
	-- 			undercurl = true,
	-- 		},
	-- 	}
	-- end,
	-- highlight_overrides = {
	-- 	all = function(color)
	-- 		return {
	-- 			TabLineSel = {
	-- 				bg = color.red,
	-- 			},
	-- 		}
	-- 	end,
	-- },
	integrations = {
		aerial = false,
		barbar = false,
		beacon = false,
		cmp = true,
		coc_nvim = false,
		dashboard = true,
		fern = false,
		fidget = false,
		gitgutter = false,
		gitsigns = true,
		harpoon = false,
		hop = false,
		illuminate = false,
		leap = false,
		lightspeed = false,
		lsp_saga = false,
		lsp_trouble = false,
		markdown = true,
		mason = true,
		mini = false,
		neogit = false,
		neotest = false,
		neotree = false,
		noice = false,
		notify = false,
		nvimtree = true,
		overseer = false,
		pounce = false,
		semantic_tokens = false,
		symbols_outline = false,
		telekasten = false,
		telescope = true,
		treesitter = true,
		treesitter_context = true,
		ts_rainbow = false,
		vim_sneak = false,
		vimwiki = false,
		which_key = false,
		bufferline = false,

		-- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
		dap = {
			enabled = false,
			enable_ui = false,
		},
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		navic = {
			enabled = false,
			custom_bg = "NONE",
		},
	},
})
-- vim.cmd([[highlight TabLineSel cterm=underline gui=underline guisp=red]])
-- vim.cmd([[highlight BufferlineIndicatorSelected cterm=underline,bold gui=underline,bold guisp=red]])
-- vim.api.nvim_set_hl()
-- vim.highlight.create(
-- 	"BufferlineIndicatorSelected",
-- 	{ cterm = "underline,bold", gui = "underline,bold", guisp = "red" },
-- 	false
-- )
