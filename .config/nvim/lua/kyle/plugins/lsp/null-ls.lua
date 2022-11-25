local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local code_actions = null_ls.builtins.code_actions

local completion = null_ls.builtins.completion

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	debug = false,
	sources = {
		-- formatting
		formatting.prettier.with({
			extra_args = {
				"--print-width=80",
				"--tab-width=4",
				"--use-tabs=true",
				"--bracket-same-line=true",
				"--single-attribute-per-line=true",
			},
		}),
		formatting.stylua,
		formatting.beautysh.with({
			extra_args = { "-i=4" },
		}),
		formatting.eslint_d,
		formatting.prismaFmt.with({
			extra_args = { "-s", "4" },
		}),
		-- completion
		completion.luasnip,
		-- diagnostics
		diagnostics.eslint_d.with({ -- js/ts linter
			-- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
			condition = function(utils)
				return utils.root_has_file(".eslintrc.json") -- change file extension if you use something else
			end,
		}),
		diagnostics.jsonlint,
		diagnostics.tsc,
		diagnostics.zsh,
		-- code actions
		code_actions.eslint_d,
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePost", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
