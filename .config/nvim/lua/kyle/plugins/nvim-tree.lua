-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- configure nvim-tree
nvimtree.setup({
	auto_reload_on_write = false,
	hijack_directories = {
		enable = false,
	},
	update_cwd = true,
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	view = {
		hide_root_folder = true, -- disable showing of root folder
		adaptive_size = true,
		signcolumn = "yes",
	},
	-- change folder arrow icons
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	filters = {
		dotfiles = false,
		custom = { "node_modules", "\\.cache" },
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	-- disable window_picker for
	-- explorer to work well with
	-- window splits
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		open_file = {
			quit_on_open = true,
			window_picker = {
				enable = false,
			},
		},
	},
})
