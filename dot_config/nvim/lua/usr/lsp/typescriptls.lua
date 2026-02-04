local handlers = require("usr.lsp.handlers")

vim.lsp.config('ts_ls', {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  settings = {
    implicitProjectConfig = { checkJs = true }
  }
})
