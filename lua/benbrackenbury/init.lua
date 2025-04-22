---@diagnostic disable: undefined-global
require("benbrackenbury.keymap")
require("benbrackenbury.autocmd")
require("benbrackenbury.lazy")

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
vim.opt.listchars = { space = '.', tab = '-> ' }

vim.opt.laststatus = 3
vim.opt.splitkeep = "screen"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

--LSP & Autocomplete
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
})
vim.o.completeopt = "noselect,menuone,popup,fuzzy"

-- Enable diagnostics
vim.diagnostic.config({
    virtual_lines = true,
    virtual_text = false
})
