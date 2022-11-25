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

local M = {}

function M.list_registered_providers_names(filetype)
	local s = require("null-ls.sources")
	local available_sources = s.get_available(filetype)
	local registered = {}
	for _, source in ipairs(available_sources) do
		for method in pairs(source.methods) do
			registered[method] = registered[method] or {}
			table.insert(registered[method], source.name)
		end
	end
	return registered
end

-- formatter
local formatting_method = null_ls.methods.FORMATTING

function M.formatter_list_registered(filetype)
	local registered_providers = M.list_registered_providers_names(filetype)
	return registered_providers[formatting_method] or {}
end

-- linter
local linter_method = {
	null_ls.methods.DIAGNOSTICS,
	null_ls.methods.DIAGNOSTICS_ON_OPEN,
	null_ls.methods.DIAGNOSTICS_ON_SAVE,
}

function M.linter_list_registered(filetype)
	local registered_providers = M.list_registered_providers_names(filetype)
	local providers_for_methods = vim.tbl_flatten(vim.tbl_map(function(m)
		return registered_providers[m] or {}
	end, linter_method))

	return providers_for_methods
end

return M
