return {
    {
        "ThePrimeagen/refactoring.nvim",
        keys = {
            {
                "<leader>r",
                function(opts)
                    require("refactoring").select_refactor(opts)
                end,
                mode = "v",
                noremap = true,
                silent = true,
                expr = false,
                desc = "Refactor",
            },
        },
        opts = {},
    },
    {
        "L3MON4D3/LuaSnip",
        keys = function()
            return {}
        end,
    },
    {
        -- Incremental rename
        "smjonas/inc-rename.nvim",
        cmd = "IncRename",
        config = function(_, opts)
            require("inc_rename").setup(opts)
        end,
    },
    {
        "ThePrimeagen/git-worktree.nvim",
        keys = {
            {
                -- <Enter> - switches to that worktree
                -- <c-d> - deletes that worktree
                -- <c-f> - toggles forcing of the next deletion
                "<leader>gwe",
                function()
                    require("telescope").extensions.git_worktree.git_worktrees()
                end,
                desc = "Explore Git Worktree",
            },
            {
                "<leader>gwc",
                function()
                    require("telescope").extensions.git_worktree.create_git_worktree()
                end,
                desc = "Create Git Worktree",
            },
        },
        opts = {
            change_directory_command = "cd",
            update_on_change = true,
            update_on_change_command = "e .",
            clearjumps_on_change = true,
            autopush = false,
        },
        config = function(_, opts)
            local git_worktree = require("git-worktree")

            git_worktree.setup(opts)
        end,
    },
    {
        -- Create annotations with one keybind, and jump your cursor in the inserted annotation
        "danymat/neogen",
        keys = {
            {
                "<leader>cc",
                function()
                    require("neogen").generate({})
                end,
                desc = "Neogen Comment",
            },
        },
        opts = { snippet_engine = "luasnip" },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-emoji",
        },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            local has_words_before = function()
                unpack = unpack or table.unpack
                ---@type integer, integer
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local luasnip = require("luasnip")
            local cmp = require("cmp")

            opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))

            opts.window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            }

            opts.mapping = vim.tbl_extend("force", opts.mapping, {
                ---@type string
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                    -- they way you will only jump inside the snippet region
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ---@type string
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            })
        end,
    },
}
