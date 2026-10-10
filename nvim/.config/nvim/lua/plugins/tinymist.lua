return {
vim.lsp.config('tinymist', {
  cmd = { 'tinymist' },
  filetypes = { 'typst'},
  root_markers = { 'typst.toml','.git' },
  settings = {
      exportPdf = 'never',
      outputPath = '$root/out',
      formatterMode = 'typstyle',
      vim.lsp.enable('tinymist')
  },
})
}
