local handlers = require("usr.lsp.handlers")

vim.lsp.config('helm_ls', {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
  settings = {
    ["helm-ls"] = {
      yamlls = {
        path = "yaml-language-server",
      },
    },
  },
})
