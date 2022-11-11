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
