vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

require("benbrackenbury.remap")
require("benbrackenbury.set")
require("benbrackenbury.lazy")
require("benbrackenbury.colorscheme")


vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end,
})

