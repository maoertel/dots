local M = {}

M.setup = function()
  local config = {
    virtual_text = true,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN]  = "",
        [vim.diagnostic.severity.INFO]  = "",
        [vim.diagnostic.severity.HINT]  = "",
      }
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = true,
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)
end

local function lsp_highlight_document(client, bufnr)
  if client.server_capabilities.documentHighlightProvider then
    local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
    vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
    vim.api.nvim_create_autocmd("CursorHold", {
      group = group,
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = group,
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gp", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help({ border = \"rounded\" })<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover({ border = \"rounded\" })<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>sl", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fo', "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]]
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  lsp_highlight_document(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp = require("cmp_nvim_lsp")

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
