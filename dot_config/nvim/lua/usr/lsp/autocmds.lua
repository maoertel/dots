-- Autoformat on write
vim.api.nvim_create_autocmd(
  "BufWritePre", {
  pattern = { "*.rs", "*.scala", "*.go" },
  callback = function()
    vim.lsp.buf.format { async = false }
  end
})
