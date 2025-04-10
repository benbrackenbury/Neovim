return {
    "tris203/precognition.nvim",
    opts = {
        startVisible = false,
        showBlankVirtLine = false,
    },
    config = function()
        vim.keymap.set('n', '<leader>n', function()
            require("precognition").peek()
        end)
        vim.keymap.set('n', '<leader>N', function()
            require("precognition").toggle()
        end)
    end
}
