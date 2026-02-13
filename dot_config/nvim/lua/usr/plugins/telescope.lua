return {
  -- Telescope UI Select (load early to override vim.ui.select)
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("ui-select")
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    event = "VeryLazy",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>" },
      { "<leader>fj", "<cmd>Telescope find_files hidden=true<cr>" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
      { "<leader>fk", "<cmd>Telescope grep_string<cr>" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
      { "<leader>fs", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>" },
      { "<leader>fw", "<cmd>Telescope lsp_workspace_symbols<cr>" },
      { "<leader>fd", "<cmd>Telescope lsp_document_symbols<cr>" },
      { "<leader>fr", "<cmd>Telescope registers<cr>" },
      { "<leader>fp", "<cmd>Telescope pickers<cr>" },
      { "<leader>we", "<cmd>Telescope file_browser<cr>" },
      { "<leader>gc", "<cmd>Telescope git_commits<cr>" },
      { "<leader>gr", "<cmd>Telescope git_branches<cr>" },
      { "<leader>gs", "<cmd>Telescope git_stash<cr>" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "folke/trouble.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local trouble = require("trouble.sources.telescope")

      telescope.setup({
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "smart" },
          mappings = {
            i = {
              ["<C-/>"] = actions.which_key,
              ["<C-t>"] = trouble.open,
            },
            n = {
              ["?"] = actions.which_key,
              ["<C-t>"] = trouble.open,
            },
          },
        },
        pickers = {
          buffers = {
            show_all_buffers = true,
            sort_lastused = true,
            mappings = {
              i = { ["<C-e>"] = actions.delete_buffer },
              n = { ["d"] = actions.delete_buffer },
            },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          file_browser = {
            path = "%:p:h",
            hidden = true,
            grouped = true,
            hijack_netrw = false,
            initial_mode = "normal",
          },
        },
      })

      telescope.load_extension("file_browser")
    end,
  },
}
