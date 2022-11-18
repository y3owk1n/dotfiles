lvim.plugins = {
    -- {
    --     "bluz71/vim-nightfly-guicolors",
    -- },
    {
        "catppuccin/nvim",
        config = function()
            -- local colors = require("catppuccin.palettes").get_palette() -- fetch colors from palette
            local colors = require("catppuccin.palettes").get_palette "macchiato"

            local options = {
                transparent_background = true,
                compile = {
                    enabled = true,
                    path = vim.fn.stdpath "cache" .. "/catppuccin"
                },
                integrations = {
                    harpoon = true,
                    telescope = true,
                    nvimtree = true,
                    gitsigns = true,
                    mason = true,
                    treesitter = true,
                    treesitter_context = true,
                    which_key = true,
                    dap = {
                        enabled = true,
                        enable_ui = true,
                    },
                    indent_blankline = {
                        enabled = true,
                        colored_indent_levels = false,
                    },
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                        },
                    },
                },
                custom_highlights = {
                    Comment = { fg = colors.surface2, style = { "italic" } }, -- just comments
                    Constant = { fg = colors.peach }, -- (preferred) any constant
                    String = { fg = colors.yellow, style = { "italic", "bold" } }, -- a string constant: "this is a string"
                    Character = { fg = colors.teal }, --  a character constant: 'c', '\n'
                    Number = { fg = colors.maroon }, --   a number constant: 234, 0xff
                    Float = { fg = colors.maroon }, --    a floating point constant: 2.3e10
                    Boolean = { fg = colors.maroon }, --  a boolean constant: TRUE, false
                    Identifier = { fg = colors.text }, -- (preferred) any variable name
                    Function = { fg = colors.green }, -- function name (also: methods for classes)
                    Statement = { fg = colors.mauve }, -- (preferred) any statement
                    Conditional = { fg = colors.red }, --  if, then, else, endif, switch, etcp.
                    Repeat = { fg = colors.red }, --   for, do, while, etcp.
                    Label = { fg = colors.peach }, --    case, default, etcp.
                    Operator = { fg = colors.text }, -- "sizeof", "+", "*", etcp.
                    Keyword = { fg = colors.pink }, --  any other keyword
                    PreProc = { fg = colors.peach }, -- (preferred) generic Preprocessor
                    Include = { fg = colors.green }, --  preprocessor #include
                    StorageClass = { fg = colors.yellow }, -- static, register, volatile, etcp.
                    Structure = { fg = colors.yellow }, --  struct, union, enum, etcp.
                    Typedef = { fg = colors.yellow }, --  A typedef
                    Special = { fg = colors.peach }, -- (preferred) any special symbol
                    Type = { fg = colors.teal }, -- (preferred) int, long, char, etcp.
                    TSInclude = { fg = colors.peach, style = { "italic" } },
                    ["@include"] = { fg = colors.peach, style = { "italic" } },
                    TSField = { fg = colors.blue }, -- For fields.
                    ["@field"] = { fg = colors.blue }, -- For fields.
                    TSProperty = { fg = colors.blue }, -- Same as TSField.
                    ["@property"] = { fg = colors.blue }, -- Same as TSField.
                    TSConstant = { fg = colors.maroon }, -- For constants
                    ["@constant.builtin"] = { fg = colors.maroon }, -- For constants
                    TSParameter = { fg = colors.text, style = { "italic" } }, -- For parameters of a function.
                    ["@parameter"] = { fg = colors.text, style = { "italic" } }, -- For parameters of a function.
                    TSOperator = { fg = colors.text },
                    ["@operator"] = { fg = colors.text },
                    TSKeywordFunction = { fg = colors.peach }, -- For keywords used to define a fuction.
                    ["@keyword.function"] = { fg = colors.peach }, -- For keywords used to define a fuction.
                    TSKeyword = { fg = colors.peach }, -- For keywords that don't fall in previous categories.
                    ["@keyword"] = { fg = colors.peach }, -- For keywords that don't fall in previous categories.
                    TSKeywordReturn = { fg = colors.peach },
                    ["@keyword.return"] = { fg = colors.peach },
                    TSType = { fg = colors.teal }, -- For types.
                    ["@type"] = { fg = colors.teal }, -- For types.
                    TSTypeBuiltin = { fg = colors.teal, style = { "italic" } }, -- For builtin types.
                    ["@type.builtin"] = { fg = colors.teal, style = { "italic" } }, -- For builtin types.
                    TSVariableBuiltin = { fg = colors.red }, -- Variable names that are defined by the languages, like this or self.
                    ["@variable.builtin"] = { fg = colors.red }, -- Variable names that are defined by the languages, like this or self.
                    TSFunction = { fg = colors.green }, -- For function (calls and definitions).
                    ["@function.builtin"] = { fg = colors.green }, -- For function (calls and definitions).
                    TSMethod = { fg = colors.green }, -- For method calls and definitions.
                    ["@function"] = { fg = colors.green }, -- For method calls and definitions.
                    TSString = { fg = colors.yellow, style = { "italic" } }, -- For strings.
                    ["@string"] = { fg = colors.yellow, style = { "italic" } }, -- For strings.
                    BufferLineSeparator = { fg = colors.peach, bg = "NONE" },
                    BufferLineBufferVisible = { fg = colors.surface1, bg = "NONE" },
                    BufferLineBufferSelected = { fg = colors.text, bg = "NONE", style = { "bold", "italic" } }, -- current
                    BufferLineIndicatorSelected = { fg = colors.peach, bg = "NONE" },
                },
            }
            require("catppuccin").setup(options)
        end,
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
    {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require('neoscroll').setup({
                -- All these keys will be mapped to their corresponding default scrolling animation
                mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
                    '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
                hide_cursor = true, -- Hide cursor while scrolling
                stop_eof = true, -- Stop at <EOF> when scrolling downwards
                use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = nil, -- Default easing function
                pre_hook = nil, -- Function to run before the scrolling animation starts
                post_hook = nil, -- Function to run after the scrolling animation ends
            })
        end
    },
    {
        "romgrk/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup {
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                throttle = true, -- Throttles plugin updates (may improve performance)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                    -- For all filetypes
                    -- Note that setting an entry here replaces all other patterns for this entry.
                    -- By setting the 'default' entry below, you can control which nodes you want to
                    -- appear in the context window.
                    default = {
                        'class',
                        'function',
                        'method',
                        'for',
                        'while',
                        'if',
                        'switch',
                        'case',
                    },
                    markdown = {
                        'section',
                    },
                    json = {
                        'pair',
                    },
                    yaml = {
                        'block_mapping_pair',
                    },
                },
            }
        end
    },
}
