local M = {}

M.base46 = {
  theme = "coffee",
  transparent = true,
}


vim.keymap.set("n", "<leader>fy", function()
  require("custom.yazi").open_in_float()
end, { desc = "Open Yazi File Picker", noremap = true, silent = true })

-- Normal mode mappings using vim.keymap.set
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files", noremap = true, silent = true })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep", noremap = true, silent = true })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers", noremap = true, silent = true })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags", noremap = true, silent = true })
vim.keymap.set("n", "<leader>tp", "<cmd>TypstPreview<cr>", { desc = "Typst Preview", noremap = true, silent = true })
vim.keymap.set("n", "<leader>rm", "<cmd>RenderMarkdown<cr>", { desc = "Render Markdown", noremap = true, silent = true })
vim.keymap.set("n", "<leader>ts",
  "<cmd>lua local s = require('noice.config').options.lsp.signature; s.auto_open.enabled = not s.auto_open.enabled; vim.notify('Signature auto-open: ' .. tostring(s.auto_open.enabled))<cr>",
  { desc = "Toggle signature auto-open", noremap = true, silent = true })
  
  vim.api.nvim_create_autocmd("BufReadPost", {
   pattern = "*.pdf",
   callback = function()
     local file_path = vim.api.nvim_buf_get_name(0)
     require("pdfview").open(file_path)
   end,
 })
return M
