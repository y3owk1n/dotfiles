local function hasObsidianFileInRoot()
    local current_dir = vim.fn.expand("%:p:h") -- Get the current directory of the open file

    while current_dir ~= "/" do
        local obsidian_config = current_dir .. "/.obsidian.vimrc"
        local file_exists = vim.fn.filereadable(obsidian_config)

        if file_exists == 1 then
            return obsidian_config
        end

        current_dir = vim.fn.fnamemodify(current_dir, ":h") -- Move up one directory
    end

    return nil -- .obsidian file not found
end

local opts = {}

if hasObsidianFileInRoot() then
    opts = {
        markdown = {
            img_dir = { "98 - attachments" }, -- Use table for nested dir (New feature form PR #20)
            img_dir_text = "",
            affix = "![[%s]]", -- Multi lines affix
        },
    }
end

return {
    "postfen/clipboard-image.nvim",
    lazy = true,
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    opts = opts,
}
