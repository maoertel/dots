require("nvim-treesitter.configs").setup {
  modules = {},
  ensure_installed = "all",
  sync_install = false,
  auto_install = true,
  ignore_install = { "" },

  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = false,
  },
}

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, { pattern = '*.conf', command = 'set ft=hocon' })

--[[ require("nvim-treesitter.configs").setup { ]]
--[[   ensure_installed = "all", ]]
--[[   sync_install = false, ]]
--[[   ignore_install = { "phpdoc", "smali" }, ]]
--[[   autopairs = { ]]
--[[     enable = true, ]]
--[[   }, ]]
--[[   highlight = { ]]
--[[     enable = true, ]]
--[[     disable = { "" }, ]]
--[[     additional_vim_regex_highlighting = true, ]]
--[[   }, ]]
--[[   rainbow = { ]]
--[[     enable = false ]]
--[[   }, ]]
--[[   indent = { enable = true, disable = { "yaml" } }, ]]
--[[   modules = {}, ]]
--[[   auto_install = true, ]]
--[[ } ]]
--[[]]
--[[ require("ts_context_commentstring").setup { ]]
--[[     languages = { ]]
--[[       rust = { ]]
--[[         "//", ]]
--[[         "/*", ]]
--[[         "*/", ]]
--[[       }, ]]
--[[   }, ]]
--[[     config = {}, ]]
--[[     commentary_integration = { "nvim-ts-context-commentstring"}, ]]
--[[     enable_autocmd = false, ]]
--[[ } ]]
