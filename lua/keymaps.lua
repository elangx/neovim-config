-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
-- <Leader> to ,
vim.g.mapleader = ","

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- For nvim-tree.lua
-- default leader key: \
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- bufferline 左右Tab切换
vim.keymap.set("n", "<C-,>", ":BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "<C-.>", ":BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts)
vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts)
vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opts)
vim.keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opts)
vim.keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opts)
vim.keymap.set("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opts)
vim.keymap.set("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opts)
vim.keymap.set("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opts)
vim.keymap.set("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opts)
vim.keymap.set("n", "<leader>0", ":BufferLineGoToBuffer -1<CR>", opts)
vim.keymap.set("n", "<leader>q", ":bd<CR>", opts)
vim.keymap.set("n", "<leader>aq", ":BufferLineCloseOthers<CR>", opts)



-- git-blame
vim.keymap.set("n", "<leader>b",":BlameToggle window<CR>", opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)