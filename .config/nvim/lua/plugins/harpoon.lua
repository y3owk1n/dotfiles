return {
    "ThePrimeagen/harpoon",
    keys = {
        { "<leader>he", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Menu" },
        { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add mark" },
    },
    config = function(_, opts)
        require("harpoon").setup(opts)
    end,
}
