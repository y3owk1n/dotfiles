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
    keys = {
        { "<localleader>o", "<cmd>ObsidianOpen<CR>", desc = "Open in Obsidian" },
        { "<localleader>n", "<cmd>ObsidianNew<CR>", desc = "New note" },
        { "<localleader>b", "<cmd>ObsidianBackLinks<CR>", desc = "Backlinks list" },
        { "<localleader>t", "<cmd>ObsidianToday<CR>", desc = "Today Note" },
        { "<localleader>y", "<cmd>ObsidianYesterday<CR>", desc = "Yesterday Note" },
    },
    opts = {
        workspaces = {
            {
                name = "kyle",
                path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Kyle/",
            },
            {
                name = "traworld",
                path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Traworld/",
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

        -- Optional, sort search results by "path", "modified", "accessed", or "created".
        -- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example `:ObsidianQuickSwitch`
        -- will show the notes sorted by latest modified time
        sort_by = "modified",
        sort_reversed = true,

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

        -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
        -- URL it will be ignored but you can customize this behavior here.
        follow_url_func = function(url)
            -- Open the URL in the default web browser.
            vim.fn.jobstart({ "open", url }) -- Mac OS
            -- vim.fn.jobstart({"xdg-open", url})  -- linux
        end,
    },
}
