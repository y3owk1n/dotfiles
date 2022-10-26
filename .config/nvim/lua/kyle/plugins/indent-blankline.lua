-- import indent blankline plugin safely
local setup, indent = pcall(require, "indent_blankline")
if not setup then
	return
end

-- enable indent
indent.setup({
	show_current_context = true,
	show_current_context_start = true,
})
