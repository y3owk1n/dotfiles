-- import session lens plugin safely
local setup, lens = pcall(require, "session-lens")
if not setup then
	return
end

-- enable session lens
lens.setup({
	path_display = { "shorten" },
	prompt_title = "SESSIONS",
	previewer = true,
})
