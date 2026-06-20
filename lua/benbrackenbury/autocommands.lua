vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Highlight selection on yank',
    pattern = '*',
    callback = function()
        vim.hl.on_yank { higroup = 'IncSearch', timeout = 500 }
    end,
})


vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    if vim.fn.expand("%:e:e") == "blade.php" then
      return
    end
    vim.bo.indentexpr = ""
    vim.bo.smartindent = true
  end,
})
