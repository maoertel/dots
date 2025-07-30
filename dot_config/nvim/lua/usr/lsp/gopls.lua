local handlers = require("usr.lsp.handlers")
local util = require("lspconfig/util")

require("lspconfig").gopls.setup {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      staticcheck = true,
      analyses = {
        unusedparams = true,
      },
      gofumpt = true,
    },
  },
}

vim.api.nvim_create_autocmd(
  "BufWritePre", {
    pattern = '*.go',
    callback = function()
      vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
    end
  })
