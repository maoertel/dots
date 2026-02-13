return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("usr.lsp.handlers").setup()
      require("usr.lsp.mason")
      require("usr.lsp.lua-ls")
      require("usr.lsp.autocmds")
      require("usr.lsp.rustaceanvim")
      require("usr.lsp.scala-metals")
      require("usr.lsp.jsonls")
      require("usr.lsp.yamlls")
      require("usr.lsp.typescriptls")
      require("usr.lsp.terraformls")
      require("usr.lsp.gopls")
      require("usr.lsp.python-lsp-server")
      require("usr.lsp.helm-ls")
    end,
  },
  {
    "Maan2003/lsp_lines.nvim",
    event = "LspAttach",
    config = function()
      require("lsp_lines").setup()
    end,
  },
}
