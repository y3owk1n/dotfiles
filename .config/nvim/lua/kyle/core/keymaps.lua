-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local opts = { silent = true } -- set options

---------------------
-- General Keymaps
---------------------

-- without copying into register
keymap.set("n", "x", '"_x')
-- keymap.set("n", "d", '"_d')
keymap.set("n", "c", '"_c')

-- window management
keymap.set("n", "sv", ":vsplit<Return><C-w>w", opts) -- split window vertically
keymap.set("n", "ss", ":split<Return><C-w>w", opts) -- split window horizontally
keymap.set("n", "sx", ":close<CR>", opts) -- close current split window
keymap.set("", "sh", "<C-w>h", opts) -- move window left
keymap.set("", "sk", "<C-w>k", opts) -- move window up
keymap.set("", "sj", "<C-w>j", opts) -- move window down
keymap.set("", "sl", "<C-w>l", opts) -- move window right

keymap.set("n", "tt", ":tabnew<CR>", opts) -- open new tab
keymap.set("n", "tx", ":tabclose<CR>", opts) -- close current tabkeyma
keymap.set("n", "tl", ":tabn<CR>", opts) --  go to next tab
keymap.set("n", "th", ":tabp<CR>", opts) --  go to previous tab

keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts) -- Move line up
keymap.set("v", "K", ":m '>-2<CR>gv=gv", opts) -- Move line down

keymap.set("n", "<C-a>", "gg<S-v>G", opts) -- Select all

keymap.set("n", "<C-d>", "<C-d>zz", opts) -- Half page down and center
keymap.set("n", "<C-u>", "<C-u>zz", opts) -- Half page up and center

keymap.set("n", "n", "nzzzv", opts) -- Next and center during search
keymap.set("n", "N", "Nzzzv", opts) -- Previous and center during search

keymap.set("n", ";P", '"0P', opts) -- Paste before with yanked but not deleted
keymap.set("n", ";p", '"0p', opts) -- Paste after with yanked but not deleted
