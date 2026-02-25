return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>" },
    },
    -- Load when opening a directory
    init = function()
      if vim.fn.argc() == 1 then
        local arg = vim.fn.argv(0)
        if vim.fn.isdirectory(arg) == 1 then
          require("lazy").load({ plugins = { "nvim-tree.lua" } })
        end
      end
    end,
    config = function()
      require("nvim-tree").setup({
        renderer = {
          icons = {
            diagnostics_placement = "before",
            glyphs = {
              default = "",
              symlink = "",
              git = {
                unstaged = "",
                staged = "S",
                unmerged = "",
                renamed = "➜",
                deleted = "",
                untracked = "U",
                ignored = "◌",
              },
              folder = {
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
              },
            },
          },
        },
        disable_netrw = false,
        hijack_netrw = true,
        sync_root_with_cwd = true,
        diagnostics = {
          enable = true,
          icons = { hint = "", info = "", warning = "", error = "" },
        },
        update_focused_file = { enable = true, update_root = false },
        filters = { dotfiles = false },
        git = { enable = true, ignore = true, timeout = 500 },
        view = { width = 30, side = "left" },
        trash = { cmd = "trash", require_confirm = true },
        actions = {
          open_file = { quit_on_open = true, window_picker = { enable = false } },
        },
      })
    end,
  },
}
