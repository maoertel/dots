local handlers = require("usr.lsp.handlers")
require("lspconfig").terraformls.setup {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
  filetypes = { "terraform", "terraform-vars", "tf", "tfvars" },
  path = "-tf-exec=~/bin/terraform",
}

vim.api.nvim_create_autocmd(
  "BufWritePre", {
    pattern = { "*.tf", "*.tfvars" },
    callback = function()
      vim.lsp.buf.format { async = true }
    end
  })

vim.api.nvim_create_autocmd(
  { "BufNewFile", "BufRead" },
  { pattern = "*.tfvars", command = "set ft=hcl" }
)
