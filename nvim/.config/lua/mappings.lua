-- ~/.config/nvim/lua/custom/mappings.lua
local M = {}   -- must declare a table first

-- add your own keymaps
local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- Navigate to the next page in the PDF
map("n", "<leader>jj", "<cmd>:lua require('pdfview.renderer').next_page()<CR>", { desc = "PDFview: Next page" })

-- Navigate to the previous page in the PDF
map("n", "<leader>kk", "<cmd>:lua require('pdfview.renderer').previous_page()<CR>", { desc = "PDFview: Previous page" })
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



