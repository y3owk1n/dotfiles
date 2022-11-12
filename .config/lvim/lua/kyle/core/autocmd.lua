local augroup = vim.api.nvim_create_augroup -- for conciseness
local autocmd = vim.api.nvim_create_autocmd -- for conciseness

-- enable text warp for json, gitcommit and markdown
autocmd("BufEnter", {
    pattern = { "*.json", "*.jsonc", "gitcommit", "markdown" },
    command = "setlocal wrap",
})

-- bash highlight for zsh
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
