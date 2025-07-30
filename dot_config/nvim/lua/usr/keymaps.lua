local noremap = { noremap = true }
local silent = { silent = true }
local opts = vim.tbl_deep_extend("force", noremap, silent)

local keymap = vim.keymap.set

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal = "n",
--   insert = "i",
--   replace = "r"
--   visual = "v",
--   visual block = "x",
--   select = "s",
--   term = "t",
--   command = "c",

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

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>fj", ":Telescope find_files hidden=true<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>fk", ":Telescope grep_string<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<cr>", opts)
keymap("n", "<leader>fs", ":Telescope lsp_dynamic_workspace_symbols<cr>", opts)
keymap("n", "<leader>fw", ":Telescope lsp_workspace_symbols<cr>", opts)
keymap("n", "<leader>fd", ":Telescope lsp_document_symbols<cr>", opts)
keymap("n", "<leader>fr", ":Telescope registers<cr>", opts)
keymap("n", "<leader>fp", ":Telescope pickers<cr>", opts)

-- File explorer via Telescope
keymap("n", "<leader>we", ":Telescope file_browser<CR>", noremap)
--[[ keymap("n", "<leader>e", ":Telescope file_browser path=%:p:h<CR>", noremap) ]]

-- Treeview
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Harpoon
keymap("n", "<leader>hh", ":lua require(\"harpoon.ui\").toggle_quick_menu()<CR>", opts)
keymap("n", "<leader>hm", ":Telescope harpoon marks<CR>", opts)
keymap("n", "<leader>ha", ":lua require(\"harpoon.mark\").add_file()<CR>", opts)
keymap("n", "<leader>hr", ":lua require(\"harpoon.mark\").rm_file()<CR>", opts)
keymap("n", "<leader>hc", ":lua require(\"harpoon.mark\").clear_all()<CR>", opts)

-- Trouble
keymap("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
keymap("n", "<leader>xw", "<cmd>Trouble diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>Trouble diagnostics_buffer<cr>", opts)
keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)

-- Fugitive 
keymap("n", "<leader>gb", ":G blame<cr>", opts)
keymap("n", "<leader>gd", ":DiffviewOpen<cr>", opts)
keymap("n", "<leader>gp", ":GBrowse<cr>", opts)
keymap("v", "<leader>gp", ":.GBrowse<CR>", noremap)
keymap("n", "<leader>gc", ":Telescope git_commits<CR>", noremap)
keymap("n", "<leader>gr", ":Telescope git_branches<CR>", noremap)
keymap("n", "<leader>gs", ":Telescope git_stash<CR>", noremap)

-- Navigate tabs
keymap("n", "<leader>ta", ":tabnew<CR>", opts)
keymap("n", "<leader>tc", ":tabclose<CR>", opts)
keymap("n", "<leader>to", ":tabonly<CR>", opts)
keymap("n", "<leader>tn", ":tabn<CR>", opts)
keymap("n", "<leader>tp", ":tabp<CR>", opts)
keymap("n", "<leader>tmp", ":-tabmove<CR>", opts)
keymap("n", "<leader>tmn", ":+tabmove<CR>", opts)

-- copilot
--[[ vim.g.copilot_assume_mapped = true ]]
--[[ keymap("i", "<C-[>", "copilot#Accept(\"<CR>\")", { silent = true, expr = true }) ]]
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap('i', '<C-[>', 'copilot#Accept("<CR>")', {expr=true, silent=true})

