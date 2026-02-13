return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({
        plugins = {
          marks = true,
          registers = true,
          spelling = { enabled = false },
        },
        win = {
          border = "rounded",
        },
      })
      wk.add({
        { "<leader>d", group = "debug" },
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>x", group = "trouble" },
        { "<leader>t", group = "tabs" },
        { "<leader>w", desc = "save" },
        { "<leader>q", desc = "quit" },
        { "<leader>e", desc = "file tree" },
      })
    end,
  },
}
