return {
    -- add rose-pine
    {
        "rose-pine/neovim",
        lazy = true,
        priority = 1000,
        name = "rose-pine",
        config = function(_, opts)
            require("rose-pine").setup(opts)
        end,
        opts = function()
            return {
                disable_background = true,
                disable_float_background = true,
            }
        end,
    },

    -- Configure LazyVim to load rose-pine-moon
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "rose-pine-moon",
        },
    },
}
