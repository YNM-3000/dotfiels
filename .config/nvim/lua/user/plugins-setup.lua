-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- add list of plugins to install
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- packer can manage itself
	use("nvim-lua/popup.nvim") -- an implementation of the Popup Api from vim to neovim
	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	-- colorscheme
	-- use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
	use({ "EdenEast/nightfox.nvim" })
	use({ "catppuccin/nvim", as = "catppuccin" })

	--  color highlighter
	use({ "norcalli/nvim-colorizer.lua" })

	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

	use("szw/vim-maximizer") -- maximizes and restores current window

	-- essential plugins
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("vim-scripts/ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	use("numToStr/Comment.nvim")

	-- todo
	use("folke/todo-comments.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- vs-code like icons
	use("kyazdani42/nvim-web-devicons")

	-- bufferline
	use("akinsho/bufferline.nvim")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- indent blankline
	use("lukas-reineke/indent-blankline.nvim")

	-- rainbow delimiters
	use("HiPhish/rainbow-delimiters.nvim")

	-- fuzzy finding w/ telescope
	use({
		"aaronhallaert/advanced-git-search.nvim",
		requires = {
			-- "nvim-telescope/telescope.nvim",
			-- to show diff splits and open commits in browser
			"tpope/vim-fugitive",
			-- to open commits in browser with fugitive
			"tpope/vim-rhubarb",
			-- optional: to replace the diff from fugitive with diffview.nvim
			-- (fugitive is still needed to open in browser)
			-- "sindrets/diffview.nvim",
		},
	}) -- advanced git search extension for Telescope and fzf-lua

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	-- cmp plugins for autocompletion
	use("hrsh7th/nvim-cmp") -- completion framework
	use("hrsh7th/cmp-nvim-lsp") -- source for LSP,using by lspconfig
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	use("hrsh7th/cmp-cmdline") -- source for cmdline
	use("saadparwaiz1/cmp_luasnip") -- source snippet completions
	use("lvimuser/lsp-inlayhints.nvim") -- LSP inlay hint.
	-- use("hrsh7th/cmp-nvim-lsp-signature-help") -- source for LSP signature

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)

	-- lsp signature
	use("ray-x/lsp_signature.nvim")

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- code fold
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	-- mark file and navigation
	use("ThePrimeagen/harpoon")

	-- file struct
	use("preservim/tagbar")

	-- undo
	use("mbbill/undotree")

	-- session manager
	use("mhinz/vim-startify")

	-- -- preview
	-- use("frabjous/knap")

	-- -- translate
	-- use("potamides/pantran.nvim")

	-- trouble
	use("folke/trouble.nvim")

	-- -- term
	-- use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- leap
	use("ggandor/leap.nvim")

	-- translate
	use("voldikss/vim-translator")

	------------ go
	-- vim-go
	use("fatih/vim-go")

	-- goimpl.vim
	-- require
	-- use("edolphin-ydf/goimpl.nvim")
	use("edolphin-ydf/goimpl.nvim")

	----------- git
	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- lazygit
	use("kdheepak/lazygit.nvim")

	-- diffview
	use("sindrets/diffview.nvim")

	-- conflict
	use({ "akinsho/git-conflict.nvim", tag = "*" })

	-- diffview
	use("rhysd/git-messenger.vim")
	----------- AI
	-- code assitant
	use({
		"Exafunction/codeium.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({})
		end,
	})

	-- java
	use({ "mfussenegger/nvim-jdtls" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
