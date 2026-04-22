return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    cmd = "Copilot",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_version = 0
      vim.fn["copilot#Init"]()
      vim.cmd([[imap <silent><expr> <C-]> copilot#Accept("\<CR>")]])
    end,
  },
}
