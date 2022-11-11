-- Unbind default keymaps
lvim.keys.normal_mode["<leader>h"] = false -- Disable default no highlight

-- Bind new keymaps
lvim.keys.normal_mode["x"] = '"_x' -- Delete single character without copy to register
lvim.keys.normal_mode["<C-a>"] = "gg<S-v>G" -- Select all
lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv" -- Move one line up
lvim.keys.visual_mode["K"] = ":m '>-2<CR>gv=gv" -- Move one line down

-- Unbind default which-keys keymaps
lvim.builtin.which_key.mappings["h"] = {} -- remove default highlight from which-key
