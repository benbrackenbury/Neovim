return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require "telescope".setup {
            pickers = {
                colorscheme = {
                    enable_preview = true
                }
            }
        }

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>ft', function()
            builtin.colorscheme({ enable_preview = true });
        end)
    end
}

