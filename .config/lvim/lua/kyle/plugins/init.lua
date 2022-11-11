lvim.plugins = {
    {
        "bluz71/vim-nightfly-guicolors",
    },
    {
        "ThePrimeagen/harpoon"
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    {
        "tpope/vim-surround",
        -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
        -- setup = function()
        --  vim.o.timeoutlen = 500
        -- end
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require "lsp_signature".on_attach() end,
    },
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup()
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "*" })
        end,
    },
}
