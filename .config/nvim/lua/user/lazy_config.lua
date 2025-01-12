return {
	"nvim-lua/popup.nvim", -- an implementation of the Popup Api from vim to neovim
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use

	-- colorscheme
	-- 'bluz71/vim-nightfly-guicolors', -- preferred colorscheme
	-- { "EdenEast/nightfox.nvim" },
	{ "catppuccin/nvim", as = "catppuccin" },

	-- color highlighter
	{ "norcalli/nvim-colorizer.lua" },

	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	"szw/vim-maximizer", -- maximizes and restores current window

	-- essential plugins
	"tpope/vim-surround", -- add, delete, change surroundings (it's awesome)
	"vim-scripts/ReplaceWithRegister", -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	"numToStr/Comment.nvim",

	-- todo
	"folke/todo-comments.nvim",

	-- file explorer
	"nvim-tree/nvim-tree.lua",

	-- vs-code like icons
	"kyazdani42/nvim-web-devicons",

	-- rainbow delimiters
	"HiPhish/rainbow-delimiters.nvim",

	-- fuzzy finding w/ telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"aaronhallaert/advanced-git-search.nvim",
				dependencies = {
					-- to show diff splits and open commits in browser
					"tpope/vim-fugitive",
					-- to open commits in browser with fugitive
					"tpope/vim-rhubarb",
				},
			},
			"debugloop/telescope-undo.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
			{
				"edolphin-ydf/goimpl.nvim",
				dependencies = {
					{ "nvim-lua/plenary.nvim" },
					{ "nvim-lua/popup.nvim" },
					{ "nvim-treesitter/nvim-treesitter" },
				},
			},
			-- optional: to replace the diff from fugitive with diffview.nvim
			-- (fugitive is still needed to open in browser)
			-- 'sindrets/diffview.nvim',
		},
	},

	-- cmp plugins for autocompletion
	"hrsh7th/nvim-cmp", -- completion framework
	"hrsh7th/cmp-nvim-lsp", -- source for LSP,using by lspconfig
	"hrsh7th/cmp-buffer", -- source for text in buffer
	"hrsh7th/cmp-path", -- source for file system paths
	"hrsh7th/cmp-cmdline", -- source for cmdline
	"saadparwaiz1/cmp_luasnip", -- source snippet completions
	"lvimuser/lsp-inlayhints.nvim", -- LSP inlay hint.
	-- 'hrsh7th/cmp-nvim-lsp-signature-help', -- source for LSP signature

	-- snippets
	"L3MON4D3/LuaSnip", -- snippet engine
	"rafamadriz/friendly-snippets", -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
	"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	"neovim/nvim-lspconfig", -- easily configure language servers
	{
		"glepnir/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	}, -- enhanced lsp uis
	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)

	-- lsp signature
	"ray-x/lsp_signature.nvim",

	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	},

	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
	{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }, -- autoclose tags

	-- code fold
	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },

	-- mark file and navigation
	"ThePrimeagen/harpoon",

	-- undo
	"mbbill/undotree",

	-- session manager
	"mhinz/vim-startify",

	-------- preview --------
	-- 'frabjous/knap',

	-------- diaglostic --------
	"folke/trouble.nvim",

	-------- cursor --------
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
  -- stylua: ignore
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
	"mg979/vim-visual-multi",

	-------- translate --------
	"voldikss/vim-translator",

	-------- ui --------
	-- bufferline
	"akinsho/bufferline.nvim",

	-- statusline
	"nvim-lualine/lualine.nvim",

	-- indent blankline
	"lukas-reineke/indent-blankline.nvim",

	-- message and command line
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		-- add any options here
	-- 	},
	-- 	dependencies = {
	-- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	-- 		"MunifTanjim/nui.nvim",
	-- 		-- OPTIONAL:
	-- 		--   `nvim-notify` is only needed, if you want to use the notification view.
	-- 		--   If not available, we use `mini` as the fallback
	-- 		"rcarriga/nvim-notify",
	-- 	},
	-- },

	-------- go --------
	"fatih/vim-go",

	-------- git --------
	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	"kdheepak/lazygit.nvim",
	"sindrets/diffview.nvim",
	{ "akinsho/git-conflict.nvim" },
	"rhysd/git-messenger.vim",

	-------- AI --------
	{
		"Exafunction/codeium.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({})
		end,
	},

	-------- java --------
	{ "mfussenegger/nvim-jdtls" },
}
