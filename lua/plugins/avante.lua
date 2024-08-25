return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    opts = {},
    config = function()
        require("avante").setup({
            provider = "copilot",
        })
    end,
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below is optional, make sure to setup it properly if you have lazy=true
        {
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
