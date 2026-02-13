return {
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n" },
      { "gbc", mode = "n" },
      { "gc", mode = { "n", "v" } },
      { "gb", mode = { "n", "v" } },
    },
    config = function()
      require("Comment").setup({
        padding = true,
        sticky = true,
        toggler = { line = "gcc", block = "gbc" },
        opleader = { line = "gc", block = "gb" },
        extra = { above = "gcO", below = "gco", eol = "gcA" },
        mappings = { basic = true, extra = true, extended = false },
      })
    end,
  },
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
}
