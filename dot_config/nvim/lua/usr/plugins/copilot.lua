local function copilot_globally_off()
  local enabled = vim.g.copilot_enabled
  return enabled == 0 or enabled == false
end

return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    cmd = "Copilot",
    keys = {
      {
        "<leader>cp",
        function()
          if copilot_globally_off() then
            vim.cmd("Copilot enable")
            vim.notify("Copilot enabled", vim.log.levels.INFO)
          else
            vim.cmd("Copilot disable")
            vim.notify("Copilot disabled", vim.log.levels.WARN)
          end
        end,
        desc = "toggle copilot (global)",
      },
      {
        "<leader>cb",
        function()
          -- b:copilot_enabled only narrows the global setting, it cannot override it
          local enabled = vim.b.copilot_enabled
          if enabled == nil then
            enabled = not copilot_globally_off()
          end
          vim.b.copilot_enabled = not enabled
          if enabled then
            vim.notify("Copilot disabled for this buffer", vim.log.levels.WARN)
          elseif copilot_globally_off() then
            vim.notify("Copilot still off globally (<leader>cp)", vim.log.levels.WARN)
          else
            vim.notify("Copilot enabled for this buffer", vim.log.levels.INFO)
          end
        end,
        desc = "toggle copilot (buffer)",
      },
      { "<leader>cs", "<cmd>Copilot status<cr>", desc = "copilot status" },
    },
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_version = 0
      vim.fn["copilot#Init"]()
      vim.cmd([[imap <silent><expr> <C-]> copilot#Accept("\<CR>")]])
    end,
  },
}
