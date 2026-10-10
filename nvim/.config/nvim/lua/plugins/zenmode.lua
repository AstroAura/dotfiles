return {
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
  }

