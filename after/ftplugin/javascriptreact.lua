vim.keymap.set('n', '<leader>fm', function()
    local success = pcall(function() vim.cmd('Prettier') end)
    if not success then
        vim.lsp.buf.format()
    end
end)
