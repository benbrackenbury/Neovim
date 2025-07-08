-- Highlight yanked selections
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
    end,
})

-- Enable auto-complete
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})

-- .cshtml = razor
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = {"*.cshtml", "*.razor"},
  callback = function()
    vim.bo.filetype = "razor"
  end,
})
