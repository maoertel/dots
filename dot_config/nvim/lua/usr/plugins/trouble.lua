return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble<cr>" },
      { "<leader>xw", "<cmd>Trouble diagnostics<cr>" },
      { "<leader>xd", "<cmd>Trouble diagnostics_buffer<cr>" },
      { "<leader>xl", "<cmd>Trouble loclist<cr>" },
      { "<leader>xq", "<cmd>Trouble quickfix<cr>" },
      { "gR", "<cmd>Trouble lsp_references<cr>" },
    },
    config = function()
      require("trouble").setup({
        modes = {
          diagnostics_buffer = {
            mode = "diagnostics",
            filter = { buf = 0 },
          },
        },
      })
    end,
  },
}
