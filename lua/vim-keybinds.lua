-- navigate windows
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
-- move selected lines up and down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==") -- move down 
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==") -- move up 
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi") -- move down in insert mode
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi") -- move up in insert mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move down in visual mode
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move up in visual mode
