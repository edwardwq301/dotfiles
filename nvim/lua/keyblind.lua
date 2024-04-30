vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 保存本地变量,之后就可以这样映射按键了
-- map('模式','按键','映射为XX',opt)
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)

map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
map("n", "sc", "<C-w>c", opt) -- close now window
map("n", "so", "<C-w>o", opt) -- close others

map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)

-- nvimTree
map('n', '<A-m>', ':NvimTreeToggle<CR>', opt)

-- nvim-treesitter 代码格式化
map("n", "<leader>i", "gg=G", opt)