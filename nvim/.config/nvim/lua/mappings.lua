-- ~/.config/nvim/lua/custom/mappings.lua
local M = {}   -- must declare a table first

-- add your own keymaps
local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- NvChad-style mappings table
M.general = {
  n = {
    ["<leader>fy"] = {
      function() require("custom.yazi").open_in_float() end,
      "Open Yazi File Picker",
    },
  },
}

return M



