vim.opt.mouse = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.scrolloff = 16
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.o.winborder = "rounded"
vim.o.completeopt = "noselect,menuone,popup,fuzzy"
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.pack.add({
    "https://github.com/vague2k/vague.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/prettier/vim-prettier",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/Wansmer/treesj",
    "https://github.com/echasnovski/mini.surround",
    "https://github.com/mbbill/undotree",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/christoomey/vim-tmux-navigator",
    "https://github.com/L3MON4D3/LuaSnip",
})
require("mason").setup()
require('oil').setup({})
require('treesj').setup({})
require('mini.surround').setup({})
require("nvim-treesitter.configs").setup({
    auto_install = true,
    highlight = { enable = true },
})

require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>oo", "<CMD>Oil<CR>")
vim.keymap.set("n", "<leader>ot", "<CMD>tab Oil<CR>")
vim.keymap.set("n", "<leader>ov", "<CMD>vert Oil<CR>")
vim.keymap.set("n", "<leader>oh", "<CMD>belowright Oil<CR>")
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", "<CMD>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>ft", "<CMD>Telescope filetypes<CR>")
vim.keymap.set("n", "<leader>fb", "<CMD>Telescope buffers<CR>")
vim.keymap.set("i", "jk", "<esc>l")
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")

for _, key in pairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
    vim.keymap.set({ 'n', 'v', 'x', 'i' }, key, '<nop>')
end

vim.lsp.enable({
    'lua_ls',
    'ts_ls',
    'eslint',
    'tailwindcss',
    'emmet_language_server',
    'gopls',
    'intelephense',
    'docker_language_server',
    'docker_compose_language_service',
    'csharp_ls',
    'laravel_ls',
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
    end,
})

require("luasnip").setup({ enable_autosnippets = true })
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
local ls = require("luasnip")
vim.keymap.set({ "i" }, "<C-e>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(1) end, { silent = true })
