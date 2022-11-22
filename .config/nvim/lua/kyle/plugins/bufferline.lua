-- import bufferline plugin safely
local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

-- enable bufferline
bufferline.setup({
	highlights = {
		background = {
			italic = true,
		},
		buffer_selected = {
			bold = true,
		},
	},
	options = {
		mode = "tabs",
		separator_style = "thin",
		always_show_bufferline = false,
		show_buffer_close_icons = false,
		show_close_icon = false,
		color_icons = true,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
	},
})
