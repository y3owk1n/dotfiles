-- buffer line tab issues and workaround
-- https://github.com/LunarVim/LunarVim/issues/3367#issuecomment-1314162362

local function is_ft(b, ft)
    return vim.bo[b].filetype == ft
end

lvim.builtin.bufferline.options.mode = "tabs"
lvim.builtin.bufferline.options.always_show_bufferline = false
lvim.builtin.bufferline.options.show_buffer_close_icons = false
lvim.builtin.bufferline.options.show_close_icon = false
lvim.builtin.bufferline.options.show_tab_indicators = false

local function custom_filter(buf, buf_nums)

    local logs = vim.tbl_filter(function(b)
        return is_ft(b, "log")
    end, buf_nums or {})
    if vim.tbl_isempty(logs) then
        return true
    end
    local tab_num = vim.fn.tabpagenr()
    local last_tab = vim.fn.tabpagenr "$"
    local is_log = is_ft(buf, "log")
    if last_tab == 1 then
        return true
    end
    -- only show log buffers in secondary tabs
    return (tab_num == last_tab and is_log) or (tab_num ~= last_tab and not is_log)
end

lvim.builtin.bufferline.options.custom_filter = custom_filter
