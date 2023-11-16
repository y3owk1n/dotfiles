return {
    -- Incremental rename
    "smjonas/inc-rename.nvim",
    keys = {
        {
            "<leader>rn",
            ":IncRename ",
            desc = "Rename",
        },
    },
    cmd = "IncRename",
    config = true,
}
