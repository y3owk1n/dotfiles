--------------------
-- Options
---------------------

-- general lvim options
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.reload_config_on_save = true
lvim.colorscheme = "nightfly"
lvim.transparent_window = true
lvim.leader = "space"


-- general vim options
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
vim.opt.hlsearch = false -- do not highlight search
vim.opt.tabstop = 4 -- insert 4 spaces for a tab
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.showtabline = 4 -- always show tabs
vim.opt.autoindent = true -- auto indent when going to new line

---------------------
-- Keybinds
---------------------

-- Unbind default keymaps
lvim.keys.normal_mode["<leader>h"] = false -- Disable default no highlight

-- Bind new keymaps
lvim.keys.normal_mode["x"] = '"_x' -- Delete single character without copy to register
lvim.keys.normal_mode["<C-a>"] = "gg<S-v>G" -- Select all
lvim.keys.normal_mode["<leader>ha"] = "<cmd>lua require('harpoon.mark').add_file()<CR>" -- Harpoon add a mark
lvim.keys.normal_mode["<leader>he"] = "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>" -- Harpoon quick menu toggle
lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv" -- Move one line up
lvim.keys.visual_mode["K"] = ":m '>-2<CR>gv=gv" -- Move one line down

-- Unbind default which-keys keymaps
lvim.builtin.which_key.mappings["h"] = {} -- remove default highlight from which-key

---------------------
-- Plugins Configurations
---------------------

-- alpha
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

-- terminal
lvim.builtin.terminal.active = true

-- nvim tree
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- telescope
lvim.builtin.telescope.pickers.find_files.previewer = nil
lvim.builtin.telescope = {
    active = true,
    defaults = {
        layout_strategy = "horizontal",
    },
    pickers = {
        git_files = {
            hidden = true,
        },
        live_grep = {
            hidden = true,
        },
    },
}

-- lualine
local new_colors = {
    blue = "#65D1FF",
    green = "#3EFFDC",
    violet = "#FF61EF",
    yellow = "#FFDA7B",
    black = "#000000",
}
local lualine_nightfly = require "lualine.themes.nightfly"
lualine_nightfly.normal.a.bg = new_colors.blue
lualine_nightfly.insert.a.bg = new_colors.green
lualine_nightfly.visual.a.bg = new_colors.violet
lualine_nightfly.command = {
    a = {
        gui = "bold",
        bg = new_colors.yellow,
        fg = new_colors.black, -- black
    },
}
lvim.builtin.lualine.options.theme = lualine_nightfly

-- tree sitter
lvim.builtin.treesitter.ensure_installed = {
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "vim",
    "yaml",
    "markdown",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.rainbow.enable = true

---------------------
-- Formatter
---------------------

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    -- { command = "black", filetypes = { "python" } },
    -- { command = "isort", filetypes = { "python" } },
    {
        -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "prettier",
        ---@usage arguments to pass to the formatter
        -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
        extra_args = { "--print-with", "100" },
        ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    },
}

---------------------
-- Linter
---------------------

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    { command = "eslint_d", filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" } },
}

---------------------
-- Plugins
---------------------

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
}

---------------------
-- Utilities
---------------------

local augroup = vim.api.nvim_create_augroup -- for conciseness
local autocmd = vim.api.nvim_create_autocmd -- for conciseness

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
autocmd("BufEnter", {
    pattern = { "*.json", "*.jsonc" },
    -- enable wrap mode for json files only
    command = "setlocal wrap",
})

autocmd("FileType", {
    pattern = "zsh",
    callback = function()
        -- let treesitter use bash highlight for zsh files as well
        require("nvim-treesitter.highlight").attach(0, "bash")
    end,
})

-- yank group
local yank_group = augroup("HighlightYank", {}) -- for conciseness

autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})
