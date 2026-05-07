vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/mbbill/undotree",
	"https://github.com/christoomey/vim-tmux-navigator",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/AndrewRadev/tagalong.vim",
	"https://github.com/folke/ts-comments.nvim",
	"https://github.com/wansmer/treesj",
	"https://github.com/AndrewRadev/tagalong.vim",
	"https://github.com/supermaven-inc/supermaven-nvim",
})

require("oil").setup()
require("nvim-autopairs").setup()
require("treesj").setup()
require("supermaven-nvim").setup({})

vim.g.tagalong_additional_filetypes = { "blade" }
