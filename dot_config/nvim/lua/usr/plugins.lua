local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer, then close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Was not able to load 'packer'.")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins

  -- Colorschemes
  use 'navarasu/onedark.nvim'
  use 'folke/tokyonight.nvim'
  use "EdenEast/nightfox.nvim"

  -- Tabline
  use "nanozuki/tabby.nvim"

  -- devicons
  --[[ use "kyazdani42/nvim-web-devicons" ]]
  use "nvim-tree/nvim-web-devicons"

  -- Statusline
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true }
  }

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-ui-select.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

  -- Trouble
  use "folke/trouble.nvim"

  -- Autopairs (), [], {}
  use "windwp/nvim-autopairs"

  -- Rainbow brackets
  use {
    "p00f/nvim-ts-rainbow",
    after = 'nvim-treesitter'
  }

  -- Comments
  use "numToStr/Comment.nvim"
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "tpope/vim-fugitive"
  use "tpope/vim-rhubarb"
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Github Co-Pilot
  use "github/copilot.vim"

  -- Tree view
  use "kyazdani42/nvim-tree.lua"

  -- Harpoon
  use "ThePrimeagen/harpoon"

  -- Zen mode
  use "folke/zen-mode.nvim"

  -- Autocompletion (cmp) plugins
  use "hrsh7th/nvim-cmp" -- autocompletion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- lsp completions

  -- Snippets
  use "L3MON4D3/LuaSnip" -- Snippet engine

  -- LSP
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "Maan2003/lsp_lines.nvim"
  --[[ use 'WhoIsSethDaniel/lualine-lsp-progress.nvim' ]]
  use "neovim/nvim-lspconfig" -- Enable LSP

  -- Tree sitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "nvim-treesitter/nvim-treesitter-context"
  use "nvim-treesitter/playground"

  -- Markdown preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Rust tools
  use "mrcjkb/rustaceanvim"

  -- Scala metals
 use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
