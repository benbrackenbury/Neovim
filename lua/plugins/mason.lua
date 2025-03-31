return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = {
                    "lua_ls",
                    "eslint",
                    "ts_ls",
                    "tailwindcss",
                    "intelephense",
                    "gopls",
                    "dockerls",
                    "docker_compose_language_service",
                    "astro",
                },
            }
        end
    },
}
