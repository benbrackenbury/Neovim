vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
})
require("nvim-treesitter").setup({
	auto_install = true,
	highlight = { enable = true },
})
require("treesitter-context").setup()
