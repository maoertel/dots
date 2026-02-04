-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Core dependencies (load immediately)
  { "nvim-lua/plenary.nvim", lazy = true },
  { "nvim-lua/popup.nvim", lazy = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Colorscheme (load first)
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme nightfox")
    end,
  },
  { "navarasu/onedark.nvim", lazy = true },
  { "folke/tokyonight.nvim", lazy = true },

  -- Tabline
  {
    "nanozuki/tabby.nvim",
    event = "VeryLazy",
    config = function()
      require("tabby").setup()
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        sections = {
          lualine_c = { "filename", "lsp_progress" },
        },
      })
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
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
      "nvim-telescope/telescope-ui-select.nvim",
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

      telescope.load_extension("ui-select")
      telescope.load_extension("file_browser")
    end,
  },

  -- Trouble (diagnostics)
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble<cr>" },
      { "<leader>xw", "<cmd>Trouble diagnostics<cr>" },
      { "<leader>xd", "<cmd>Trouble diagnostics_buffer<cr>" },
      { "<leader>xl", "<cmd>Trouble loclist<cr>" },
      { "<leader>xq", "<cmd>Trouble quickfix<cr>" },
      { "gR", "<cmd>Trouble lsp_references<cr>" },
    },
    config = function()
      require("trouble").setup({
        position = "bottom",
        height = 10,
        width = 50,
        mode = "workspace_diagnostics",
        modes = {
          diagnostics_buffer = {
            mode = "diagnostics",
            filter = { buf = 0 },
          },
        },
        fold_open = "?",
        fold_closed = "?",
        group = true,
        padding = true,
        action_keys = {
          close = "q",
          cancel = "<esc>",
          refresh = "r",
          jump = { "<cr>", "<tab>" },
          open_split = { "<c-x>" },
          open_vsplit = { "<c-v>" },
          open_tab = { "<c-t>" },
          jump_close = { "o" },
          toggle_mode = "m",
          toggle_preview = "P",
          hover = "K",
          preview = "p",
          close_folds = { "zM", "zm" },
          open_folds = { "zR", "zr" },
          toggle_fold = { "zA", "za" },
          previous = "k",
          next = "j",
        },
        indent_lines = true,
        auto_open = false,
        auto_close = false,
        auto_preview = true,
        auto_fold = false,
        auto_jump = { "lsp_definitions" },
        signs = {
          error = "",
          warning = "",
          hint = "",
          information = "",
          other = "﫠",
        },
        use_diagnostic_signs = false,
      })
    end,
  },

  -- File tree
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
            glyphs = {
              default = "",
              symlink = "",
              git = {
                unstaged = "",
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
        update_cwd = true,
        diagnostics = {
          enable = true,
          icons = { hint = "", info = "", warning = "", error = "" },
        },
        update_focused_file = { enable = true, update_cwd = true },
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

  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    keys = {
      { "<leader>hh", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>' },
      { "<leader>ha", '<cmd>lua require("harpoon.mark").add_file()<cr>' },
      { "<leader>hr", '<cmd>lua require("harpoon.mark").rm_file()<cr>' },
      { "<leader>hc", '<cmd>lua require("harpoon.mark").clear_all()<cr>' },
    },
    config = function()
      require("harpoon").setup({
        global_settings = {
          save_on_toggle = true,
          save_on_change = true,
          excluded_filetypes = { "harpoon" },
        },
      })
    end,
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
        ts_config = {
          lua = { "string", "source" },
          javascript = { "string", "template_string" },
          java = false,
        },
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        fast_wrap = {
          map = "<M-e>",
          chars = { "{", "[", "(", '"', "'" },
          pattern = [=[[%'%"%)%>%]%)%}%,]]=],
          end_key = "$",
          keys = "qwertyuiopzxcvbnmasdfghjkl",
          check_comma = true,
          highlight = "PmenuSel",
          highlight_grey = "LineNr",
        },
      })
    end,
  },

  -- Rainbow delimiters
  { "HiPhish/rainbow-delimiters.nvim", event = "BufReadPost" },

  -- Comments
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

  -- Git
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

  -- Copilot
  { "github/copilot.vim", event = "InsertEnter" },

  -- Zen mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("zen-mode").setup({
        window = {
          backdrop = 1,
          width = 120,
          height = 1,
          options = {
            signcolumn = "yes",
            number = true,
            relativenumber = true,
            cursorline = true,
          },
        },
        plugins = {
          options = { enabled = true, ruler = true, showcmd = true },
          twilight = { enabled = false },
          gitsigns = { enabled = true },
          tmux = { enabled = true },
        },
      })
    end,
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip/loaders/from_vscode").lazy_load()

      local check_backspace = function()
        local col = vim.fn.col(".") - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
      end

      local kind_icons = {
        Text = "", Method = "m", Function = "", Constructor = "",
        Field = "", Variable = "", Class = "", Interface = "",
        Module = "", Property = "", Unit = "", Value = "",
        Enum = "", Keyword = "", Snippet = "", Color = "",
        File = "", Reference = "", Folder = "", EnumMember = "",
        Constant = "", Struct = "", Event = "", Operator = "",
        TypeParameter = "",
      }

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
          ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-y>"] = cmp.config.disable,
          ["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif check_backspace() then
              fallback()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
            })[entry.source.name]
            return vim_item
          end,
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
        confirm_opts = { behavior = cmp.ConfirmBehavior.Replace, select = false },
        window = {
          documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
        },
        experimental = { ghost_text = false, native_menu = false },
      })
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("usr.lsp.handlers").setup()
      require("usr.lsp.mason")
      require("usr.lsp.lua-ls")
      require("usr.lsp.autocmds")
      require("usr.lsp.rustaceanvim")
      require("usr.lsp.scala-metals")
      require("usr.lsp.jsonls")
      require("usr.lsp.yamlls")
      require("usr.lsp.typescriptls")
      require("usr.lsp.terraformls")
      require("usr.lsp.gopls")
      require("usr.lsp.python-lsp-server")
    end,
  },
  { "Maan2003/lsp_lines.nvim", event = "LspAttach" },

  -- Rust
  {
    "mrcjkb/rustaceanvim",
    ft = { "rust" },
  },

  -- Scala
  {
    "scalameta/nvim-metals",
    ft = { "scala", "sbt" },
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Treesitter (parser installer - highlighting is built into Neovim 0.10+)
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
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

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npm install",
  },
})
