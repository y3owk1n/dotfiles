local augroup = vim.api.nvim_create_augroup -- for conciseness
local autocmd = vim.api.nvim_create_autocmd -- for conciseness

local yank_group = augroup("HighlightYank", {}) -- for conciseness

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})
