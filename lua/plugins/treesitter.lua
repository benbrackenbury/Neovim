return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
        require 'nvim-treesitter.configs'.setup({
            ensure_installed = { "javascript", "typescript", "go", "html", "php", "c", "lua", "vim", "vimdoc", "query" },
            indent = {
                enable = true,
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ['aa'] = '@parameter.outer',
                        ['ia'] = '@parameter.inner',
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                        ['ii'] = '@conditional.inner',
                        ['ai'] = '@conditional.outer',
                        ['il'] = '@loop.inner',
                        ['al'] = '@loop.outer',
                        ['at'] = '@comment.outer',
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        [']f'] = '@function.outer',
                        [']]'] = '@class.outer',
                    },
                    goto_next_end = {
                        [']F'] = '@function.outer',
                        [']['] = '@class.outer',
                    },
                    goto_previous_start = {
                        ['[f'] = '@function.outer',
                        ['[['] = '@class.outer',
                    },
                    goto_previous_end = {
                        ['[F'] = '@function.outer',
                        ['[]'] = '@class.outer',
                    },
                },
            },
        })
    end
}

