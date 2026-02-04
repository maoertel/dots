local handlers = require("usr.lsp.handlers")

vim.lsp.config('yamlls', {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
  settings = {
    yaml = {
      keyOrdering = false,
      schemas = {
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.0/all.json"] = "k8s/**",
        ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = { "ci/*.yml", ".gitlab-ci.yml" },
      },
    }
  }
})
