return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
    },

    -- Auto set background based on OS
    {
        "f-person/auto-dark-mode.nvim",
        opts = {
            update_interval = 1000,
            set_dark_mode = function()
                vim.api.nvim_set_option_value("background", "dark", {})
                vim.cmd("colorscheme rose-pine")
                -- set lualine theme to 'auto'
                require("lualine").setup({
                    options = {
                        theme = "auto",
                    },
                })
            end,
            set_light_mode = function()
                vim.api.nvim_set_option_value("background", "light", {})
                vim.cmd("colorscheme default")
                -- set lualine theme to 'gruvbox'
                require("lualine").setup({
                    options = {
                        theme = "Tomorrow",
                    },
                })
            end,
        }
    }
}
