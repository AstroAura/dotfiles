local M = {}
local Terminal = require("toggleterm.terminal").Terminal

-- Create a floating terminal for Yazi
local yazi_term = Terminal:new({
  cmd = "yazi --chooser-file=/tmp/yazi_chooser",
  hidden = true,
  direction = "float",
  close_on_exit = true,
  float_opts = {
    border = "rounded",
    width = math.floor(vim.o.columns * 0.8),  -- 70% of screen width
    height = math.floor(vim.o.lines * 0.9),   -- 60% of screen height
    winblend = 0,                              -- transparency (0-100)
    row = math.floor((vim.o.lines - math.floor(vim.o.lines * 0.8)) / 2),  -- vertical center
    col = math.floor((vim.o.columns - math.floor(vim.o.columns * 0.8)) / 2), -- horizontal center
  },
  on_open = function(term)
    local opts = { noremap = true, silent = true }
    -- Esc and Ctrl-c close the float
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", "<C-\\><C-n>:close<CR>", opts)
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-c>", "<C-\\><C-n>:close<CR>", opts)
  end,
})

-- Open the Yazi popup
function M.open_in_float()
  -- Reset chooser file
  os.remove("/tmp/yazi_chooser")

  -- Toggle terminal
  yazi_term:toggle()

  -- Force cursor into terminal mode
  vim.cmd("startinsert")

  -- After quitting Yazi, open the chosen file automatically
  vim.api.nvim_create_autocmd("TermClose", {
    pattern = "term://*yazi*",
    once = true,
    callback = function()
      local file = io.open("/tmp/yazi_chooser", "r")
      if file then
        local path = file:read("*l")
        file:close()
        if path and #path > 0 then
          vim.cmd("edit " .. vim.fn.fnameescape(path))
        end
      end
    end,
  })
end

return M

