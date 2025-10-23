local M = {}

M.ui = {
  theme = "lavendusk",
}


vim.keymap.set("n", "<leader>fy", function()
  require("custom.yazi").open_in_float()
end, { desc = "Open Yazi File Picker", noremap = true, silent = true })

-- Normal mode mappings using vim.keymap.set
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files", noremap = true, silent = true })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep", noremap = true, silent = true })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers", noremap = true, silent = true })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags", noremap = true, silent = true })
 vim.api.nvim_create_autocmd("BufReadPost", {
   pattern = "*.pdf",
   callback = function()
     local file_path = vim.api.nvim_buf_get_name(0)
     require("pdfview").open(file_path)
   end,
 })
return M
