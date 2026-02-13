return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("zen-mode").setup({
        window = {
          backdrop = 1,
          width = 120,
          height = 1,
          options = {
            signcolumn = "yes",
            number = true,
            relativenumber = true,
            cursorline = true,
          },
        },
        plugins = {
          options = { enabled = true, ruler = true, showcmd = true },
          twilight = { enabled = false },
          gitsigns = { enabled = true },
          tmux = { enabled = true },
        },
      })
    end,
  },
}
