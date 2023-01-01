local nvimtree_ok, nvimtree = pcall(require, "nvim-tree")
if not nvimtree_ok then
	return
end

-- recommended settings from nvim-tree documentation

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

nvimtree.setup({
	open_on_setup = true,
	reload_on_bufenter = true,
	view = {
		adaptive_size = true,
		mappings = {
			custom_only = false,
			list = {
				{ key = "l", action = "preview" },
				{ key = "<C-o>", action = "vsplit" },
				{ key = "h", action = "close_node" },
			},
		},
	},
	renderer = {
		root_folder_modifier = ":t",
		highlight_git = true,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			-- icons = {
			-- 	corner = "└",
			-- 	edge = "│",
			-- 	item = "│",
			-- 	bottom = "─",
			-- 	none = " ",
			-- },
		},
		icons = {
			-- git_placement = "before",
			show = {
				folder_arrow = false,
				-- file = true,
				-- folder = true,
				-- git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					-- arrow_open = "",
					-- arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "",
					untracked = "ﭟ",
					deleted = "",
					ignored = "驪",
				},
			},
		},
	},
	filters = {
		-- dotfiles = false,
		-- custom = {},
		-- exclude = {},
	},
	update_focused_file = {
		enable = true,
		-- update_root = false,
		-- ignore_list = {},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	actions = {
		open_file = {
			window_picker = {
				enable = true,
			},
		},
	},
})

-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close#naive-solution
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	nested = true,
-- 	callback = function()
-- 		if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
-- 			vim.cmd("quit")
-- 		end
-- 	end,
-- })
