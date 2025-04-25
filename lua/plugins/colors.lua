return {
    {
        'olivercederborg/poimandres.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('poimandres').setup {}
        end,

        init = function()
        end
    },
    {
        "vague2k/vague.nvim",
        config = function()
            require("vague").setup({ transparent = true })
            vim.cmd(":hi statusline guibg=NONE")
        end
    },
    {
        "f-person/auto-dark-mode.nvim",
        opts = {
            set_dark_mode = function()
                vim.api.nvim_set_option_value("background", "dark", {})
                vim.cmd("colorscheme vague")
            end,
            set_light_mode = function()
                vim.api.nvim_set_option_value("background", "light", {})
                vim.cmd("colorscheme default")
            end,
            update_interval = 500,
            fallback = "dark"
        }
    }
}
