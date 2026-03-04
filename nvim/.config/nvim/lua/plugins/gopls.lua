return {
vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod'},
  root_markers = { 'go.work', 'go.mod', '.git' },
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
      completeUnimported = true,
      usePlaceholders = false,
      vim.lsp.enable('gopls')
    },
  },
})
}

