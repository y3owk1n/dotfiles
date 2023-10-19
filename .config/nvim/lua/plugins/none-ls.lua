return {
    {
        "nvimtools/none-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "mason.nvim" },
        opts = function()
            local nls = require("null-ls")
            return {
                root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
                sources = {
                    nls.builtins.formatting.stylua,
                    nls.builtins.formatting.yamlfmt,
                    nls.builtins.formatting.beautysh.with({
                        extra_args = { "-i=4" },
                    }),
                    nls.builtins.diagnostics.jsonlint,
                    nls.builtins.diagnostics.yamllint,
                    nls.builtins.diagnostics.zsh,
                    nls.builtins.formatting.prettierd,
                },
            }
        end,
    },
}
