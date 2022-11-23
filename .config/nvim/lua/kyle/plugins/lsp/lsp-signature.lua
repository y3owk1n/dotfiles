-- import lsp signature plugin safely
local status, signature = pcall(require, "lsp_signature")
if not status then
	return
end

-- enable lsp signature
signature.setup()
