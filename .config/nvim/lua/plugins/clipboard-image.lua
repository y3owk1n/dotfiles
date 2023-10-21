local obsidian = require("utils.obsidian")

local opts = {}

if obsidian.findRoot() then
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
