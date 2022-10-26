-- import trouble plugin safely
local status, trouble = pcall(require, "trouble")
if not status then
	return
end

-- enable trouble
trouble.setup({
	auto_open = true, -- automatically open the list when you have diagnostics
	auto_close = true, -- automatically close the list when you have no diagnostics
})
