return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signcolumn = true,
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 1000,
        },
        sign_priority = 6,
        update_debounce = 100,
        max_file_length = 40000,
        preview_config = {
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
      })
    end,
  },
  { "tpope/vim-fugitive", cmd = { "G", "Git", "GBrowse" } },
  { "tpope/vim-rhubarb", dependencies = { "tpope/vim-fugitive" } },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local actions = require("diffview.actions")
      require("diffview").setup({
        diff_binaries = false,
        enhanced_diff_hl = false,
        use_icons = true,
        icons = { folder_closed = "", folder_open = "" },
        signs = { fold_closed = "", fold_open = "" },
        file_panel = {
          listing_style = "tree",
          tree_options = { flatten_dirs = true, folder_statuses = "only_folded" },
          win_config = { position = "left", width = 35 },
        },
        file_history_panel = {
          log_options = {
            single_file = { diff_merges = "combined" },
            multi_file = { diff_merges = "first-parent" },
          },
          win_config = { position = "bottom", height = 16 },
        },
        keymaps = {
          view = {
            ["<tab>"] = actions.select_next_entry,
            ["<s-tab>"] = actions.select_prev_entry,
            ["gf"] = actions.goto_file,
            ["<leader>e"] = actions.focus_files,
            ["<leader>b"] = actions.toggle_files,
          },
          file_panel = {
            ["j"] = actions.next_entry,
            ["k"] = actions.prev_entry,
            ["<cr>"] = actions.select_entry,
            ["-"] = actions.toggle_stage_entry,
            ["S"] = actions.stage_all,
            ["U"] = actions.unstage_all,
            ["R"] = actions.refresh_files,
          },
        },
      })
    end,
  },
}
