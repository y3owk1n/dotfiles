---------------------
-- Formatter
---------------------

local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup {
    -- { command = "shfmt" },
    { command = "beautysh", extra_args = { "-i=4" },
        filetypes = { "bash", "csh", "ksh", "sh", "zsh" } },
    {
        -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "prettier",
        ---@usage arguments to pass to the formatter
        -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
        extra_args = { "--print-width=80", "--tab-width=4", "--use-tabs=true", "--bracket-same-line=true",
            "--single-attribute-per-line=true" },
        ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less",
            "html", "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars" },
    },
}

---------------------
-- Linter
---------------------

local linters = require "lvim.lsp.null-ls.linters"

linters.setup {
    { command = "eslint_d", filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" } },
}
