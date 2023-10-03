return {
    -- add rose-pine
    {
        "rose-pine/neovim",
        lazy = true,
        name = "rose-pine",
    },

    -- Configure LazyVim to load rose-pine-moon
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "rose-pine-moon",
        },
    },
}
