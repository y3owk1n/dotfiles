-- import git plugin safely
local status, git = pcall(require, "git")
if not status then
	return
end

-- enable git
git.setup({
	keymaps = {
		-- Open blame window
		blame = "<Leader>gb",
		-- Open file/folder in git repository
		browse = "<Leader>go",
	},
})
