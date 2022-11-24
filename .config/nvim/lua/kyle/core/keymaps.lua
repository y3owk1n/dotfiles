-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

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
