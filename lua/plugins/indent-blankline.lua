return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@diagnostic disable-next-line: undefined-doc-name
    ---@type ibl.config
    opts = {},
    config = function()
        require("ibl").setup {
            scope = {
                enabled = false,
            },
            enabled = false,
        }
        vim.keymap.set('n', '<leader>ti', '<cmd>IBLToggle<cr>');
    end,
}
