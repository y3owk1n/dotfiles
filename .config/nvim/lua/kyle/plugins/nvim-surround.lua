-- import surround plugin safely
local setup, surround = pcall(require, "nvim-surround")
if not setup then
	return
end

-- enable surround
surround.setup()
