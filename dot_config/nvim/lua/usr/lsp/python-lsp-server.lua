local handlers = require("usr.lsp.handlers")

vim.lsp.config('pylsp', {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
})
