-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin specifications
require("lazy").setup({
  defaults = { lazy = false },
  -- Core dependencies
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",

  -- Colorschemes
  "navarasu/onedark.nvim",
  "folke/tokyonight.nvim",
  "EdenEast/nightfox.nvim",

  -- Tabline
  "nanozuki/tabby.nvim",

  -- Icons
  "nvim-tree/nvim-web-devicons",

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Telescope
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "nvim-telescope/telescope-file-browser.nvim",

  -- Trouble
  "folke/trouble.nvim",

  -- Autopairs
  "windwp/nvim-autopairs",

  -- Rainbow delimiters (replaces nvim-ts-rainbow)
  "HiPhish/rainbow-delimiters.nvim",

  -- Comments
  "numToStr/Comment.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- Git
  "lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  { "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Github Co-Pilot
  "github/copilot.vim",

  -- Tree view
  "nvim-tree/nvim-tree.lua",

  -- Harpoon
  "ThePrimeagen/harpoon",

  -- Zen mode
  "folke/zen-mode.nvim",

  -- Autocompletion (cmp)
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",

  -- Snippets
  "L3MON4D3/LuaSnip",

  -- LSP
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "Maan2003/lsp_lines.nvim",
  "neovim/nvim-lspconfig",

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  "nvim-treesitter/nvim-treesitter-context",
  -- playground removed: use built-in :InspectTree and :EditQuery instead

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npm install",
  },

  -- Rust tools
  "mrcjkb/rustaceanvim",

  -- Scala metals
  { "scalameta/nvim-metals", dependencies = { "nvim-lua/plenary.nvim" } },
})
