local icons = require("kyle.icons")
-- import indent blankline plugin safely
local setup, indent = pcall(require, "indent_blankline")
if not setup then
	return
end

-- enable indent
indent.setup({
	buftype_exclude = { "terminal", "nofile" },
	filetype_exclude = {
		"help",
		"packer",
		"NvimTree",
		"text",
	},
	char = icons.ui.LineLeft,
	show_trailing_blankline_indent = false,
	show_first_indent_level = true,
	use_treesitter = true,
	show_current_context = true,
})
