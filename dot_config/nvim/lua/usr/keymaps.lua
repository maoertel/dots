local noremap = { noremap = true }
local silent = { silent = true }
local opts = vim.tbl_deep_extend("force", noremap, silent)

local keymap = vim.keymap.set

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Centered page up / down
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Centered jump back / forward
keymap("n", "<C-o>", "<C-o>zz", opts)
keymap("n", "<C-i>", "<C-i>zz", opts)

-- Centered search
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<Up>", ":resize +2<CR>", opts)
keymap("n", "<Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<Down>", ":resize -2<CR>", opts)
keymap("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Quick escape
keymap("i", "jj", "<Esc>", noremap)

-- Quick save
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "p", '"_dP', opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Fugitive (not lazy-loaded, so keep here)
keymap("n", "<leader>gb", ":G blame<cr>", opts)
keymap("n", "<leader>gp", ":GBrowse<cr>", opts)
keymap("v", "<leader>gp", ":.GBrowse<CR>", noremap)

-- Navigate tabs
keymap("n", "<leader>ta", ":tabnew<CR>", opts)
keymap("n", "<leader>tc", ":tabclose<CR>", opts)
keymap("n", "<leader>to", ":tabonly<CR>", opts)
keymap("n", "<leader>tn", ":tabn<CR>", opts)
keymap("n", "<leader>tp", ":tabp<CR>", opts)
keymap("n", "<leader>tmp", ":-tabmove<CR>", opts)
keymap("n", "<leader>tmn", ":+tabmove<CR>", opts)

-- Copilot
vim.g.copilot_no_tab_map = true
keymap('i', '<C-]>', 'copilot#Accept("<CR>")', { expr = true, silent = true })
