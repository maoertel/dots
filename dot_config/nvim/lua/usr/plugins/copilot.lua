return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.fn["copilot#Init"]()
      vim.cmd([[imap <silent><expr> <C-]> copilot#Accept("\<CR>")]])
    end,
  },
}
