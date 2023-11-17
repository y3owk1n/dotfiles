return {
    -- add rose-pine
    {
        "rose-pine/neovim",
        lazy = true,
        priority = 1000,
        name = "rose-pine",
        opts = {
            --- @usage 'auto'|'main'|'moon'|'dawn'
            variant = "moon",
            dark_variant = "moon",
            highlight_groups = {
                TelescopeBorder = { fg = "highlight_high", bg = "none" },
                TelescopeNormal = { bg = "none" },
                TelescopePromptNormal = { bg = "base" },
                TelescopeResultsNormal = { fg = "subtle", bg = "none" },
                TelescopeSelection = { fg = "text", bg = "base" },
                TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
            },
        },
    },

    -- Configure LazyVim to load rose-pine-moon
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "rose-pine",
        },
    },
}
