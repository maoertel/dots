-- Modern nvim-treesitter setup (post-1.0 API)
require("nvim-treesitter").setup {
  ensure_installed = {
    "lua", "vim", "vimdoc", "query",
    "rust", "go", "scala", "python",
    "typescript", "javascript", "tsx", "json", "yaml",
    "html", "css", "markdown", "markdown_inline",
    "bash", "terraform", "hcl", "toml",
  },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
}

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, { pattern = '*.conf', command = 'set ft=hocon' })
