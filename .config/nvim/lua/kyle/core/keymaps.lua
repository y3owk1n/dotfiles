-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- Modes
---------------------

-- normal mode = "n"
-- insert mode = "i"
-- visual mode = "v"
-- visual block mode = "x"
-- term mode = "t"

---------------------
-- General Keymaps
---------------------

-- standard operation
keymap.set("n", "<leader>w", "<cmd>w<cr>") -- save
keymap.set("n", "<leader>q", "<cmd>q<cr>") -- quit

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true }) -- split window vertically
keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true }) -- split window horizontally
keymap.set("n", "se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "sx", ":close<CR>") -- close current split window
keymap.set("", "s<left>", "<C-w>h") -- move window left
keymap.set("", "s<up>", "<C-w>k") -- move window up
keymap.set("", "s<down>", "<C-w>j") -- move window down
keymap.set("", "s<right>", "<C-w>l") -- move window right
keymap.set("", "sh", "<C-w>h") -- move window left
keymap.set("", "sk", "<C-w>k") -- move window up
keymap.set("", "sj", "<C-w>j") -- move window down
keymap.set("", "sl", "<C-w>l") -- move window right

keymap.set("n", "tt", ":tabnew<CR>", { silent = true }) -- open new tab
keymap.set("n", "tx", ":tabclose<CR>") -- close current tabkeyma
keymap.set("n", "tl", ":tabn<CR>") --  go to next tab
keymap.set("n", "th", ":tabp<CR>") --  go to previous tab

keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move line up
keymap.set("v", "K", ":m '>-2<CR>gv=gv") -- Move line down

keymap.set("n", "<C-a>", "gg<S-v>G") -- Select all

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- harpoon
keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>")
keymap.set("n", "<leader>he", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
keymap.set("n", "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>")
keymap.set("n", "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>")
keymap.set("n", "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>")
keymap.set("n", "<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>")

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- cinnamon DEFAULT_KEYMAPS:

-- Half-window movements:
keymap.set({ "n", "x" }, "<C-u>", "<Cmd>lua Scroll('<C-u>', 1, 1)<CR>")
keymap.set({ "n", "x" }, "<C-d>", "<Cmd>lua Scroll('<C-d>', 1, 1)<CR>")

-- cinnamon EXTRA_KEYMAPS:

-- Start/end of file and line number movements:
keymap.set({ "n", "x" }, "gg", "<Cmd>lua Scroll('gg')<CR>")
keymap.set({ "n", "x" }, "G", "<Cmd>lua Scroll('G', 0, 1)<CR>")

-- Start/end of line:
keymap.set({ "n", "x" }, "0", "<Cmd>lua Scroll('0')<CR>")
keymap.set({ "n", "x" }, "^", "<Cmd>lua Scroll('^')<CR>")
keymap.set({ "n", "x" }, "$", "<Cmd>lua Scroll('$', 0, 1)<CR>")

-- Paragraph movements:
keymap.set({ "n", "x" }, "{", "<Cmd>lua Scroll('{')<CR>")
keymap.set({ "n", "x" }, "}", "<Cmd>lua Scroll('}')<CR>")

-- Previous/next search result:
keymap.set("n", "n", "<Cmd>lua Scroll('n', 1)<CR>")
keymap.set("n", "N", "<Cmd>lua Scroll('N', 1)<CR>")
keymap.set("n", "*", "<Cmd>lua Scroll('*', 1)<CR>")
keymap.set("n", "#", "<Cmd>lua Scroll('#', 1)<CR>")
keymap.set("n", "g*", "<Cmd>lua Scroll('g*', 1)<CR>")
keymap.set("n", "g#", "<Cmd>lua Scroll('g#', 1)<CR>")

-- Previous/next cursor location:
keymap.set("n", "<C-o>", "<Cmd>lua Scroll('<C-o>', 1)<CR>")
keymap.set("n", "<C-i>", "<Cmd>lua Scroll('1<C-i>', 1)<CR>")

-- Screen scrolling:
keymap.set("n", "zz", "<Cmd>lua Scroll('zz', 0, 1)<CR>")
keymap.set("n", "zt", "<Cmd>lua Scroll('zt', 0, 1)<CR>")
keymap.set("n", "zb", "<Cmd>lua Scroll('zb', 0, 1)<CR>")
keymap.set("n", "z.", "<Cmd>lua Scroll('z.', 0, 1)<CR>")
keymap.set("n", "z<CR>", "<Cmd>lua Scroll('zt^', 0, 1)<CR>")
keymap.set("n", "z-", "<Cmd>lua Scroll('z-', 0, 1)<CR>")
keymap.set("n", "z^", "<Cmd>lua Scroll('z^', 0, 1)<CR>")
keymap.set("n", "z+", "<Cmd>lua Scroll('z+', 0, 1)<CR>")
keymap.set("n", "<C-y>", "<Cmd>lua Scroll('<C-y>', 0, 1)<CR>")
keymap.set("n", "<C-e>", "<Cmd>lua Scroll('<C-e>', 0, 1)<CR>")

-- Horizontal screen scrolling:
keymap.set("n", "zH", "<Cmd>lua Scroll('zH')<CR>")
keymap.set("n", "zL", "<Cmd>lua Scroll('zL')<CR>")
keymap.set("n", "zs", "<Cmd>lua Scroll('zs')<CR>")
keymap.set("n", "ze", "<Cmd>lua Scroll('ze')<CR>")
keymap.set("n", "zh", "<Cmd>lua Scroll('zh', 0, 1)<CR>")
keymap.set("n", "zl", "<Cmd>lua Scroll('zl', 0, 1)<CR>")

-- cinnamon EXTENDED_KEYMAPS:

-- Up/down movements:
keymap.set({ "n", "x" }, "k", "<Cmd>lua Scroll('k', 0, 1)<CR>")
keymap.set({ "n", "x" }, "j", "<Cmd>lua Scroll('j', 0, 1)<CR>")
keymap.set({ "n", "x" }, "<Up>", "<Cmd>lua Scroll('k', 0, 1)<CR>")
keymap.set({ "n", "x" }, "<Down>", "<Cmd>lua Scroll('j', 0, 1)<CR>")

-- Left/right movements:
keymap.set({ "n", "x" }, "h", "<Cmd>lua Scroll('h', 0, 1)<CR>")
keymap.set({ "n", "x" }, "l", "<Cmd>lua Scroll('l', 0, 1)<CR>")
keymap.set({ "n", "x" }, "<Left>", "<Cmd>lua Scroll('h', 0, 1)<CR>")
keymap.set({ "n", "x" }, "<Right>", "<Cmd>lua Scroll('l', 0, 1)<CR>")

-- SCROLL_WHEEL_KEYMAPS:

keymap.set({ "n", "x" }, "<ScrollWheelUp>", "<Cmd>lua Scroll('<ScrollWheelUp>')<CR>")
keymap.set({ "n", "x" }, "<ScrollWheelDown>", "<Cmd>lua Scroll('<ScrollWheelDown>')<CR>")
