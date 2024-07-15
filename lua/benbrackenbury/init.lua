require("benbrackenbury.remap")
require("benbrackenbury.set")
require("benbrackenbury.lazy")
require("benbrackenbury.colorscheme")
require("benbrackenbury.swift-lsp")


vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end,
})

