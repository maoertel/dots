-- Mason setup is in plugins.lua, this just configures mason-lspconfig
require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",
    -- "rust_analyzer",
    "gopls",
    "jsonls",
    "yamlls"
  },
}
