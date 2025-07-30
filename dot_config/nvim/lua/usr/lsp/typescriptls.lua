local handlers = require("usr.lsp.handlers")

require("lspconfig").ts_ls.setup {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  settings = {
    implicitProjectConfig = { checkJs = true }
  }
}
