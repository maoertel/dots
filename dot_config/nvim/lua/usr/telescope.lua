local telescope = require("telescope")
local actions = require("telescope.actions")
local trouble = require("trouble.sources.telescope")

telescope.setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    mappings = {
      i = {
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
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
        i = {
          ["<C-e>"] = actions.delete_buffer
        },
        n = {
          ["d"] = actions.delete_buffer
        }
      }
    }
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    },
    file_browser = {
      path = "%:p:h",
      hidden = true,
      grouped = true,
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = false,
      initial_mode = "normal",
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}

telescope.load_extension("ui-select")
telescope.load_extension("file_browser")
