-- import nvim-treesitter plugin safely
local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
		disable = function(lang, buf)
			if vim.tbl_contains({ "latex" }, lang) then
				return true
			end

			local max_filesize = 1024 * 1024
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				vim.schedule(function()
					vim.api.nvim_buf_call(buf, function()
						vim.cmd("setlocal noswapfile noundofile")

						if vim.tbl_contains({ "json" }, lang) then
							vim.cmd("NoMatchParen")
							vim.cmd("syntax off")
							vim.cmd("syntax clear")
							vim.cmd("setlocal nocursorline nolist bufhidden=unload")

							vim.api.nvim_create_autocmd({ "BufDelete" }, {
								callback = function()
									vim.cmd("DoMatchParen")
									vim.cmd("syntax on")
								end,
								buffer = buf,
							})
						end
					end)
				end)
				return true
			end
		end,
	},
	-- enable indentation
	indent = { enable = true, disable = { "yaml", "python" } },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	autopairs = {
		enable = true,
	},
	-- ensure these language parsers are installed
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"bash",
		"lua",
		"gitignore",
	},
	-- auto install above language parsers
	auto_install = true,
	-- Disable cursor hold for tsx and jsx comment plugin
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
		config = {
			-- Languages that have a single comment style
			typescript = "// %s",
			css = "/* %s */",
			scss = "/* %s */",
			html = "<!-- %s -->",
			svelte = "<!-- %s -->",
			vue = "<!-- %s -->",
			json = "",
		},
	},
	textobjects = {
		swap = {
			enable = false,
			-- swap_next = textobj_swap_keymaps,
		},
		-- move = textobj_move_keymaps,
		select = {
			enable = false,
			-- keymaps = textobj_sel_keymaps,
		},
	},
	textsubjects = {
		enable = false,
		keymaps = { ["."] = "textsubjects-smart", [";"] = "textsubjects-big" },
	},
})
