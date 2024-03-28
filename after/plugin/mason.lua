local lsp = require('lsp-zero')

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp.default_setup,
  },
})
