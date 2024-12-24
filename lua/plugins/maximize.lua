return {
    "declancm/maximize.nvim",
    config = function()
        require('maximize').setup()
        vim.keymap.set('n', '<leader>z', '<cmd>Maximize<cr>', { noremap = true, silent = true })
    end
}
