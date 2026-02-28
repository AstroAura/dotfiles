return {
  -- ✅ LSP
{
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gopls = {
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
            completeUnimported = true,
          },
        },
      },

      clangd = {},
      pyright = {},
    },
  },
},

 {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {"clangd", "pyright","gopls"},
      automatic_installation = true,
    },
  },
  -- ✅ Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "markdown",
        "markdown_inline",
      },
    },
  },
 {
},
  -- ✅ Floating terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup {
        size = 20,
        open_mapping = [[<c-\>]],
        direction = "float",
        float_opts = { border = "rounded" },
      }
    end,
  },
  -- Dictionary
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "uga-rosa/cmp-dictionary"
    },
  },


  -- ✅ PDF viewer
  {
    "basola21/PDFview",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim" },
  },

  -- ✅ Dashboard
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      local ok, telescope = pcall(require, "telescope.builtin")
      if not ok then return end

      dashboard.section.header.val = {
        "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
        "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
        "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
        "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
      }

      vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#c3bbb2" })
      vim.api.nvim_set_hl(0, "DashboardButtons", { fg = "#545047" })
      dashboard.section.header.opts.hl = "DashboardHeader"

      dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
        dashboard.button("f", "  Find file", function()
          telescope.oldfiles({ cwd_only = false, path_display = { "short" }, previewer = false })
        end),
        dashboard.button("c", "  Init.lua", ":e ~/.config/nvim/lua/plugins/init.lua<CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }

      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "DashboardButtons"
      end

      alpha.setup(dashboard.config)
    end,
    lazy = false,
  },

  -- ✏️ Writing setup
  {
    "preservim/vim-pencil",
    ft = { "markdown", "text" },
    config = function()
      vim.g["pencil#wrapModeDefault"] = "soft"
      vim.g["pencil#autoformat"] = 1
      vim.cmd([[autocmd FileType markdown,text PencilSoft]])
    end,
  },

  -- 🧮 Section Wordcount
  {
    "dimfeld/section-wordcount.nvim",
    ft = { "markdown", "asciidoc", "text" },
    config = function()
      require("section-wordcount").setup {
        highlight = "String",
        virt_text_pos = "eol",
      }

      local group = vim.api.nvim_create_augroup("SectionWordcount", { clear = true })

      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = { "markdown" },
        callback = function()
          require("section-wordcount").wordcounter { header_char = "#" }
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = { "asciidoc" },
        callback = function()
          require("section-wordcount").wordcounter { header_char = "=" }
        end,
      })
    end,
  },

  -- 🪶 Noice (messages + spell toggle)
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        cmdline = { enabled = true, view = "cmdline_popup" },
        messages = { enabled = true },
        popupmenu = { enabled = true },
        presets = {
          bottom_search = false,
          command_palette = false,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = false,
        },
        opts={
          notify={
            enabled = true,
            background_colour = "#090807"
          }
        },
      })

      vim.keymap.set("n", "<leader>ss", function()
        vim.o.spell = not vim.o.spell
        vim.notify("Spell " .. (vim.o.spell and "enabled" or "disabled"), vim.log.levels.INFO)
      end, { silent = true, desc = "Toggle spell check" })
    end,
  },

  -- ✅ Zen Mode
  {
    "folke/zen-mode.nvim",
    keys = {
      { "<leader>z", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
    },
    config = function()
      local zen = require("zen-mode")
      zen.setup {
        window = {
          backdrop = 0.9,
          width = 0.8,
          height = 0.9,
          options = {
            number = false,
            relativenumber = false,
            signcolumn = "no",
          },
        },
        on_open = function()
          vim.o.laststatus = 0
          vim.o.showmode = false
          if vim.bo.filetype == "markdown" or vim.bo.filetype == "text" then
            vim.cmd("PencilSoft")
          end
        end,
        on_close = function()
          vim.o.laststatus = 2
          vim.o.showmode = true
        end,
      }
    end,
  },

  -- ✅ Live Markdown Preview
  {
    "brianhuster/live-preview.nvim",
    ft = { "markdown" },
    build = "npm install --prefix app",
    config = function()
      require("live-preview").setup {
        port = 8080,
        browser = "librewolf",
        filetypes = { "markdown" },
      }

      vim.keymap.set("n", "<leader>mp", ":LivePreview start<CR>", { desc = "Start Markdown Preview" })
      vim.keymap.set("n", "<leader>ms", ":LivePreview stop<CR>", { desc = "Stop Markdown Preview" })
    end,
  },

  -- ✅ Enable spell automatically for markdown/text
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "markdown", "text" },
        callback = function()
          vim.opt_local.spell = true
          vim.opt_local.spelllang = "en_us"
        end,
      })
    end,
  },
}


