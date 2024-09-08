function SetColorScheme()
    -- Transparent tabline
    vim.cmd('hi TabLineSel guibg=NONE')
    vim.cmd('hi TabLine guibg=NONE')
    vim.cmd('hi TabLineFill guibg=NONE')
    vim.cmd('hi TabLineSel guifg=#f9f9f9')
    vim.cmd('hi TabLine guifg=#f9f9f9')
    vim.cmd('hi TabLineFill guifg=#f9f9f9')

    -- Transparent Telescope
    vim.cmd('hi TelescopeNormal guibg=NONE')
    vim.cmd('hi TelescopeSelection guibg=NONE')
    vim.cmd('hi TelescopeSelectionCaret guibg=NONE')
    vim.cmd('hi TelescopeMultiSelection guibg=NONE')
    vim.cmd('hi TelescopeBorder guibg=NONE')
    vim.cmd('hi TelescopePromptBorder guibg=NONE')
    vim.cmd('hi TelescopeResultsBorder guibg=NONE')
    vim.cmd('hi TelescopePreviewBorder guibg=NONE')
    vim.cmd('hi TelescopeMatching guibg=NONE')
    vim.cmd('hi TelescopePromptPrefix guibg=NONE')
    vim.cmd('hi TelescopePromptPrefix guifg=#f9f9f9')
    vim.cmd('hi TelescopePromptBorder guifg=#f9f9f9')
    vim.cmd('hi TelescopeResultsBorder guifg=#f9f9f9')
    vim.cmd('hi TelescopePreviewBorder guifg=#f9f9f9')
    vim.cmd('hi TelescopeMatching guifg=#f9f9f9')
    vim.cmd('hi TelescopeSelection guifg=#f9f9f9')
    vim.cmd('hi TelescopeSelectionCaret guifg=#f9f9f9')
    vim.cmd('hi TelescopeMultiSelection guifg=#f9f9f9')
    vim.cmd('hi TelescopeBorder guifg=#f9f9f9')
end

return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
    },

    -- Auto set background based on OS
    {
        "Odilf/auto-dark-mode.nvim",
        opts = {
            update_interval = 1000,
            fallback = "dark",
            set_dark_mode = function()
                vim.api.nvim_set_option_value("background", "dark", {})
                vim.cmd("colorscheme rose-pine")
                SetColorScheme()
                require("lualine").setup({
                    options = {
                        theme = "auto",
                    },
                })
            end,
            set_light_mode = function()
                vim.api.nvim_set_option_value("background", "light", {})
                vim.cmd("colorscheme default")
                SetColorScheme()
                require("lualine").setup({
                    options = {
                        theme = "Tomorrow",
                    },
                })
            end,
        }
    }
}
