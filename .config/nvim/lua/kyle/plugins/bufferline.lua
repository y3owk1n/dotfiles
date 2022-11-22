local icons = require("kyle.icons")

-- import bufferline plugin safely
local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

local function diagnostics_indicator(_, _, diagnostics, _)
	local result = {}
	local symbols = {
		error = icons.diagnostics.Error,
		warning = icons.diagnostics.Warning,
		info = icons.diagnostics.Information,
	}
	for name, count in pairs(diagnostics) do
		if symbols[name] and count > 0 then
			table.insert(result, symbols[name] .. " " .. count)
		end
	end
	result = table.concat(result, " ")
	return #result > 0 and result or ""
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
		diagnostics_indicator = diagnostics_indicator,
	},
})
