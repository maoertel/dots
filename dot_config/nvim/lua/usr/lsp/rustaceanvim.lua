local handlers = require("usr.lsp.handlers")

vim.g.rustaceanvim = {
  tools = {
    hover_actions = {
      border = "rounded",
    },
  },
  server = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
    -- see https://github.com/rust-lang/rust-analyzer/blob/master/docs/user/generated_config.adoc
    settings = {
      ["rust-analyzer"] = {
        lens = {
          enable = true,
        },
        imports = {
          prefix = "crate",
          granularity = {
            group = "item"
          },
        },
        inlayHints = {
          lifetimeElisionHints = {
            enable = "always",
            useParameterNames = false
          },
          expressionAdjustmentHints = {
            enable = "reborrow" -- available options: always, never, reborrow
          },
          bindingModeHints = {
            enable = false,
          },
          chainingHints = {
            enable = false,
          },
          closingBraceHints = {
            enable = false,
            minLines = 25
          },
          closureReturnTypeHints = {
            enable = "never",
            maxLength = 25
          },
          parameterHints = {
            enable = false
          },
          imports = {
            prefix = "crate"
          },
          renderColons = true,
          typeHints = {
            enable = false,
            hideClosureInitialization = false,
            hideNamedConstructor = false
          },
        },
        checkOnSave = true,
        command = {
          command = "clippy",
        },
      },
    },
  }
}
