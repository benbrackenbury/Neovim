return {
    {
        "vague2k/vague.nvim",
        config = function()
            require("vague").setup({ transparent = true })
            vim.cmd(":hi statusline guibg=NONE")
            vim.cmd("colorscheme vague")
        end
    }
}
