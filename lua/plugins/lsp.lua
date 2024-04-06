return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {{
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup({})
        end
    }, {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            local lsp = require('lsp-zero')
            lsp.extend_lspconfig()
            require('mason-lspconfig').setup({
                handlers = {lsp.default_setup}
            })
        end
    }, -- LSP Support
    'neovim/nvim-lspconfig', -- Autocompletion
    'hrsh7th/nvim-cmp', 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', -- Prettier
    'MunifTanjim/prettier.nvim'}
},
{
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({
                        group = augroup,
                        buffer = bufnr
                    })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format()
                        end
                    })
                end
            end,
            sources = {null_ls.builtins.formatting.prettier}
        })

    end
  }
}
