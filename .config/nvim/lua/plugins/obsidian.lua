local obsidian = require("utils.obsidian")

return {
    "epwalsh/obsidian.nvim",
    lazy = true,
    enabled = obsidian.findRoot(),
    event = {
        "VimEnter *",
        "BufReadPre " .. vim.fn.expand("~") .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/**.md",
        "BufNewFile " .. vim.fn.expand("~") .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/**.md",
    },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "hrsh7th/nvim-cmp",
        -- see below for full list of optional dependencies 👇
    },
    opts = {
        workspaces = {
            {
                name = "kyle",
                path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Kyle/",
            },
            {
                name = "traworld",
                path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Kyle Traworld/",
            },
        },

        -- Optional, set to true to use the current directory as a vault; otherwise,
        -- the first workspace is opened by default
        detect_cwd = true,

        -- see below for full list of options 👇
        daily_notes = {
            -- Optional, if you keep daily notes in a separate directory.
            folder = "02 - daily",
        },

        -- Optional, completion.
        completion = {
            -- If using nvim-cmp, otherwise set to false
            nvim_cmp = true,
            -- Trigger completion at 2 chars
            min_chars = 2,
            -- Where to put new notes created from completion. Valid options are
            --  * "current_dir" - put new notes in same directory as the current buffer.
            --  * "notes_subdir" - put new notes in the default notes subdirectory.
            new_notes_location = "current_dir",

            -- Whether to add the output of the node_id_func to new notes in autocompletion.
            -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
            prepend_note_id = true,
        },

        -- Optional, key mappings.
        mappings = {
            -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
            ["gd"] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
        },
        -- Optional, if set to true, the specified mappings in the `mappings`
        -- table will overwrite existing ones. Otherwise a warning is printed
        -- and the mappings are not applied.
        overwrite_mappings = true,
    },
}
