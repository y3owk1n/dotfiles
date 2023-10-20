return {

    {
        "nvim-neorg/neorg",
        event = "VeryLazy",
        build = ":Neorg sync-parsers",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.ui"] = {},
                    ["core.summary"] = {},
                    ["core.autocommands"] = {},
                    ["core.journal"] = {},
                    ["core.integrations.treesitter"] = {},
                    ["core.integrations.nvim-cmp"] = {},
                    ["core.dirman"] = { -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                personal = "~/Library/Mobile Documents/com~apple~CloudDocs/Neorg/personal",
                                traworld = "~/Library/Mobile Documents/com~apple~CloudDocs/Neorg/traworld",
                            },
                            default_workspace = "personal",
                        },
                    },
                    ["core.esupports.indent"] = {
                        config = {
                            format_on_enter = true,
                            format_on_escape = true,
                        },
                    },
                    ["core.esupports.metagen"] = {
                        config = {
                            type = "auto",
                            update_date = true,
                        },
                    },
                    ["core.qol.toc"] = {
                        config = {
                            close_after_use = true,
                        },
                    },
                    ["core.completion"] = {
                        config = {
                            engine = "nvim-cmp",
                        },
                    },
                },
            })
        end,
    },
    {
        "nvim-cmp",
        dependencies = {
            "nvim-neorg/neorg",
        },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            table.insert(opts.sources, 1, {
                name = "neorg",
                group_index = 1,
                priority = 100,
            })
        end,
    },
}
