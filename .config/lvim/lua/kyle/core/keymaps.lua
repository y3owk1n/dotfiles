-- Unbind default keymaps
lvim.keys.normal_mode["<leader>h"] = false -- Disable default no highlight

-- Bind new keymaps
lvim.keys.normal_mode["x"] = '"_x' -- Delete single character without copy to register
lvim.keys.normal_mode["sv"] = ":vsplit<Return><C-w>w" -- Split window vertically
lvim.keys.normal_mode["ss"] = ":split<Return><C-w>w" -- Split window horizontally
lvim.keys.normal_mode["se"] = "<C-w>=" -- Make split window equal width & height
lvim.keys.normal_mode["sx"] = ":close<CR>" -- Close current split window
lvim.keys.normal_mode['sh'] = "<C-w>h" -- Move window left
lvim.keys.normal_mode['sk'] = "<C-w>k" -- Move window up
lvim.keys.normal_mode['sj'] = "<C-w>j" -- Move window down
lvim.keys.normal_mode['sl'] = "<C-w>l" -- Move window right

lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv" -- Move one line up
lvim.keys.visual_mode["K"] = ":m '>-2<CR>gv=gv" -- Move one line down

-- Unbind default which-keys keymaps
lvim.builtin.which_key.mappings[";"] = {} -- remove dashboard alpha from which-key
lvim.builtin.which_key.mappings["c"] = {} -- remove close buffer from which-key
lvim.builtin.which_key.mappings["b"] = {} -- remove buffer from which-key

-- Bind new whichkeys

lvim.builtin.which_key.mappings["T"] = {
    ":TodoTelescope<CR>", "Todo"
}

lvim.builtin.which_key.mappings["h"] = {
    name = "Harpoon",
    e = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Menu" },
    a = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add mark" },
}

lvim.builtin.which_key.mappings["t"] = {
    name = "Tabs",
    t = { ":tabnew<CR>", "Open a new tab" },
    x = { ":tabclose<CR>", "Close current tab" },
    l = { ":tabn<CR>", "Go to next tab" },
    h = { ":tabp<CR>", "Go to previous tab" },
}
