vim.opt.mouse = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.wrap = false
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.scrolloff = 16
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.o.winborder = "rounded"
vim.o.pumborder = "rounded"
vim.opt.backup = false
vim.opt.undodir = os.getenv("XDG_STATE_HOME") .. "/nvim/undo"
vim.opt.undofile = true
vim.o.completeopt = "noselect,menuone,popup,fuzzy"

for _, key in pairs({ "<Up>", "<Down>", "<Left>", "<Right>" }) do
	vim.keymap.set({ "n", "v", "x", "i" }, key, "<nop>")
end

vim.diagnostic.config({
	virtual_lines = {
		severity = {
			vim.diagnostic.severity.ERROR,
		},
	},
})

require("benbrackenbury.plugins")
require("benbrackenbury.neotree")
require("benbrackenbury.telescope")
require("benbrackenbury.lsp")
require("benbrackenbury.lsp-overrides")
require("benbrackenbury.treesitter")
require("benbrackenbury.autocommands")
require("benbrackenbury.keybinds")
require("benbrackenbury.appearance")
