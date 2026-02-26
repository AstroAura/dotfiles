return {
vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.work', 'go.mod', '.git' },
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
      completeUnimported = true,
      vim.lsp.enable('gopls')
    },
  },
})
}

