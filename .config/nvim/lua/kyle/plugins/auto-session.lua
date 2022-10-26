-- import auto session plugin safely
local setup, session = pcall(require, "auto-session")
if not setup then
	return
end

-- enable auto session
session.setup({
	log_level = "error",
	auto_session_suppress_dirs = { "~/", "~/Dev", "~/Downloads", "/" },
})
