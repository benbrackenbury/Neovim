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
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
                filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "markdown", "php" }
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities
            })
            lspconfig.eslint.setup({
                capabilities = capabilities
            })
            lspconfig.solargraph.setup({
                capabilities = capabilities
            })
            lspconfig.html.setup({
                capabilities = capabilities
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.intelephense.setup({
                capabilities = capabilities,
                settings = {
                    intelephense = {
                        stubs = {
                            "bcmath",
                            "bz2",
                            "calendar",
                            "Core",
                            "curl",
                            "zip",
                            "zlib",
                            "wordpress",
                            "woocommerce",
                            "acf-pro",
                            "wordpress-globals",
                            "wp-cli",
                            "genesis",
                            "polylang"
                        },
                        environment = {
                            includePaths =
                            '~/.composer/vendor/php-stubs/' -- this line forces the composer path for the stubs in case inteliphense don't find it...
                        },
                        files = {
                            maxSize = 5000000,
                        },
                    },
                },
                root_dir = lspconfig.util.root_pattern("composer.json", ".git", "package.json"),
            })
            lspconfig.gopls.setup({
                capabilities = capabilities
            })
            lspconfig.dockerls.setup({
                capabilities = capabilities
            })
            lspconfig.docker_compose_language_service.setup({
                capabilities = capabilities
            })
            lspconfig.astro.setup({
                capabilities = capabilities
            })
            lspconfig.emmet_language_server.setup({
                capabilities = capabilities,
                filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "markdown", "php", "blade" }
            })

            lspconfig["sourcekit"].setup({
                capabilities = capabilities,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
        end,
    },
}
