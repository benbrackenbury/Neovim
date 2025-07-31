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
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.o.winborder = "rounded"

-- Packages
vim.pack.add({
    { src = "https://github.com/vague2k/vague.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
})

-- Colors
require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})
require("mason").setup()
vim.cmd("set completeopt+=noselect")
vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format)
vim.lsp.enable({ "lua_ls" })

-- Git
vim.pack.add({
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/tpope/vim-fugitive" },
})
require('gitsigns').setup()
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<CR>")
