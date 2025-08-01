-- Options
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
vim.opt.isfname:append("@-@")
vim.opt.splitright = true
vim.opt.splitbelow = false
vim.opt.updatetime = 50
vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.splitkeep = "screen"
vim.opt.swapfile = false
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.o.winborder = "rounded"

-- Colors
vim.pack.add({ "https://github.com/vague2k/vague.nvim" })
require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

-- LSP
vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/nvimtools/none-ls.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvimtools/none-ls-extras.nvim",
})
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})
require("mason").setup()
vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format)
vim.lsp.enable({
    'luals',
    'typescript',
    'eslint',
    'tailwind',
    'emmet',
    'gopls',
    'intelephense',
    'docker',
    'compose',
    'csharp',
})
vim.o.completeopt = "noselect,menuone,popup,fuzzy"
local null_ls = require("null-ls")
null_ls.setup({
    null_ls.builtins.formatting.prettier
})

-- Diagnostics
vim.diagnostic.config({
    virtual_lines = true,
    virtual_text = false
})

-- Git
vim.pack.add({
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/tpope/vim-fugitive",
})
require('gitsigns').setup()
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- Files
vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
require('oil').setup({})
vim.keymap.set("n", "<leader>oo", "<CMD>Oil<CR>")
vim.keymap.set("n", "<leader>ot", "<CMD>tab Oil<CR>")
vim.keymap.set("n", "<leader>ov", "<CMD>vert Oil<CR>")
vim.keymap.set("n", "<leader>oh", "<CMD>belowright Oil<CR>")

-- TextObjects
vim.pack.add({
    {
        src = "https://github.com/Wansmer/treesj",
        keys = { '<space>m', '<space>j', '<space>s' }
    },
    "https://github.com/echasnovski/mini.surround",
})
require('treesj').setup({})
require('mini.surround').setup({})


-- Undo
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.pack.add({ "https://github.com/mbbill/undotree" })
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Telescope
vim.pack.add({ "https://github.com/nvim-telescope/telescope.nvim" })
vim.keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", "<CMD>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>ft", "<CMD>Telescope filetypes<CR>")
vim.keymap.set("n", "<leader>fb", "<CMD>Telescope buffers<CR>")

-- Vim Tmux Navigator
vim.pack.add({
    {
        src = "https://github.com/christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
            "TmuxNavigatorProcessList",
        },
        keys = {
            { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    }
})
