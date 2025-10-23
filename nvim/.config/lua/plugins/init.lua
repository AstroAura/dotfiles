return {
  -- ✅ LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },

  -- ✅ Rust tools
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
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

  -- ✅ Markdown live preview
  {
    "OXY2DEV/markview.nvim",
    ft = { "markdown" },
    config = function()
      require("markview").setup()
      vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = "*.md",
        callback = function()
          vim.cmd("Markview enable")
        end,
      })
    end,
  },

  -- ✅ Image preview (inline in markdown)
  {
    "3rd/image.nvim",
    lazy = false,
    config = function()
      require("image").setup {
        backend = "kitty", -- or "ueberzug" if not using Kitty
        integrations = {
          markdown = { enabled = true },
        },
      }
    end,
  },

  -- ✅ PDF viewer plugin
  {
    "basola21/PDFview",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim" },
  },

  -- ✅ Fancy home page / dashboard with colored header and buttons
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      local ok, telescope = pcall(require, "telescope.builtin")
      if not ok then return end

      -- ASCII header for NEOVIM
      dashboard.section.header.val = {
        "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
        "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
        "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
        "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
      }

      -- Set header and button colors
      vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#897b8e"})
      vim.api.nvim_set_hl(0, "DashboardButtons", { fg = "#c4afcb"})

      dashboard.section.header.opts.hl = "DashboardHeader"

      -- Buttons
      dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
        dashboard.button("f", "  Telescope / Find file", function()
          telescope.oldfiles({ cwd_only = false, path_display = {"short"}, previewer = false })
        end),
        dashboard.button("c", "  Init.lua config", ":e ~/.config/nvim/lua/plugins/init.lua<CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }

      -- Apply button color
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "DashboardButtons"
      end

      alpha.setup(dashboard.config)
    end,
    lazy = false,
  },
}

