return {
    {
        "vague2k/vague.nvim",
        config = function()
            require("vague").setup({ transparent = true })
            -- vim.cmd(":hi statusline guibg=NONE")
            -- vim.cmd("colorscheme vague")
        end
    },
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        -- Optional; default configuration will be used if setup isn't called.
        config = function()
            require("everforest").setup({
                vim.cmd("colorscheme everforest")
            })
        end,
    }
}
