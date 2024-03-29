return {
    -- add rose-pine
    -- {
    --     "rose-pine/neovim",
    --     lazy = true,
    --     priority = 1000,
    --     name = "rose-pine",
    --     opts = {
    --         --- @usage 'auto'|'main'|'moon'|'dawn'
    --         variant = "moon",
    --         dark_variant = "moon",
    --         highlight_groups = {
    --             TelescopeBorder = { fg = "highlight_high", bg = "none" },
    --             TelescopeNormal = { bg = "none" },
    --             TelescopePromptNormal = { bg = "base" },
    --             TelescopeResultsNormal = { fg = "subtle", bg = "none" },
    --             TelescopeSelection = { fg = "text", bg = "base" },
    --             TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
    --         },
    --     },
    -- },
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        ---@type CatppuccinOptions
        opts = {
            flavour = "macchiato", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = "latte",
                dark = "macchiato",
            },
            transparent_background = true, -- disables setting the background color.
            show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
            term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
            dim_inactive = {
                enabled = true, -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.15, -- percentage of the shade to apply to the inactive window
            },
            no_italic = false, -- Force no italic
            no_bold = false, -- Force no bold
            no_underline = false, -- Force no underline
            styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" }, -- Change the style of comments
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },
            color_overrides = {},
            custom_highlights = {},
            integrations = {
                aerial = true,
                alpha = true,
                cmp = true,
                dashboard = true,
                flash = true,
                gitsigns = true,
                headlines = true,
                illuminate = true,
                indent_blankline = { enabled = true },
                leap = true,
                lsp_trouble = true,
                mason = true,
                harpoon = true,
                markdown = true,
                mini = true,
                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" },
                    },
                },
                navic = { enabled = true, custom_bg = "lualine" },
                neotest = true,
                neotree = true,
                noice = true,
                notify = true,
                semantic_tokens = true,
                telescope = {
                    enabled = true,
                },
                treesitter = true,
                treesitter_context = true,
                which_key = true,
            },
        },
    },

    -- Configure LazyVim to load rose-pine-moon
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    },
}
