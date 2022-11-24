local icons = require("kyle.icons")

-- import telescope plugin safely
local telescope_setup_ok, telescope = pcall(require, "telescope")
if not telescope_setup_ok then
	return
end

-- import telescope actions safely
local actions_setup_ok, actions = pcall(require, "telescope.actions")
if not actions_setup_ok then
	return
end

local previewers_setup_ok, previewers = pcall(require, "telescope.previewers")
if not previewers_setup_ok then
	return
end
local sorters_setup_ok, sorters = pcall(require, "telescope.sorters")
if not sorters_setup_ok then
	return
end

-- configure telescope
telescope.setup({
	prompt_prefix = icons.ui.Telescope .. " ",
	selection_caret = icons.ui.Forward .. " ",
	entry_prefix = "  ",
	initial_mode = "insert",
	selection_strategy = "reset",
	sorting_strategy = "descending",
	layout_strategy = "horizontal",
	layout_config = {
		layout_config = {
			width = 0.75,
			preview_cutoff = 120,
			horizontal = {
				preview_width = function(_, cols, _)
					if cols < 120 then
						return math.floor(cols * 0.5)
					end
					return math.floor(cols * 0.6)
				end,
				mirror = false,
			},
			vertical = { mirror = false },
		},
	},
	vimgrep_arguments = {
		"rg",
		"--color=never",
		"--no-heading",
		"--with-filename",
		"--line-number",
		"--column",
		"--smart-case",
		"--hidden",
		"--glob=!.git/",
	},
	---@usage Mappings are fully customizable. Many familiar mapping patterns are setup as defaults.
	mappings = {
		i = {
			["<C-n>"] = actions.move_selection_next,
			["<C-p>"] = actions.move_selection_previous,
			["<C-c>"] = actions.close,
			["<C-j>"] = actions.cycle_history_next,
			["<C-k>"] = actions.cycle_history_prev,
			["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
			["<CR>"] = actions.select_default,
		},
		n = {
			["<C-n>"] = actions.move_selection_next,
			["<C-p>"] = actions.move_selection_previous,
			["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
		},
	},
	-- pickers = get_pickers(actions),
	file_ignore_patterns = {},
	path_display = { "smart" },
	winblend = 0,
	border = {},
	borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
	color_devicons = true,
	set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
	file_previewer = previewers.vim_buffer_cat.new,
	grep_previewer = previewers.vim_buffer_vimgrep.new,
	qflist_previewer = previewers.vim_buffer_qflist.new,
	file_sorter = sorters.get_fuzzy_file,
	generic_sorter = sorters.get_generic_fuzzy_sorter,
})

telescope.load_extension("fzf")
