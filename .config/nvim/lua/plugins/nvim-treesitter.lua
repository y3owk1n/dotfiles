return {
    "nvim-treesitter/nvim-treesitter",
    ---@type TSConfig
    opts = {
        ensure_installed = {
            "bash",
            "html",
            "javascript",
            "json",
            "lua",
            "vim",
            "markdown",
            "markdown_inline",
            "tsx",
            "typescript",
            "yaml",
            "prisma",
            "regex",
        },
    },
}
