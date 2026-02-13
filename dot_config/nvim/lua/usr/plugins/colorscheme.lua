return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme nightfox")
    end,
  },
  { "navarasu/onedark.nvim", lazy = true },
  { "folke/tokyonight.nvim", lazy = true },
}
