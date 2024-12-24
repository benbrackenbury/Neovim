return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                styles = {
                    bold = true,
                    ialics = true,
                    transparency = false,
                },
            })
        end,
    },


    {
        'olivercederborg/poimandres.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('poimandres').setup {}
        end,

        init = function()
            vim.cmd("colorscheme poimandres")
        end
    },
}
