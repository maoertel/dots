return {
  -- Parser installer (highlighting is built into Neovim 0.10+)
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSUpdate", "TSUninstall" },
    build = function()
      -- Install parsers on build
      local parsers = {
        "lua", "vim", "vimdoc", "query",
        "rust", "go", "scala", "python",
        "typescript", "javascript", "tsx", "json", "yaml",
        "html", "css", "markdown", "markdown_inline",
        "bash", "terraform", "hcl", "toml",
      }
      require("nvim-treesitter").install(parsers)
    end,
    config = function()
      vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
        pattern = "*.conf",
        command = "set ft=hocon",
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    config = function()
      require("treesitter-context").setup({
        enable = true,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 2,
        trim_scope = "outer",
        mode = "cursor",
        zindex = 20,
      })
    end,
  },
}
