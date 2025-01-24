return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
            vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<CR>")
            vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<CR>")
        end
    }
}
