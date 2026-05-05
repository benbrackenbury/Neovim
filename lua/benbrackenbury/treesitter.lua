vim.pack.add({
	"https://github.com/romus204/tree-sitter-manager.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
})
require("tree-sitter-manager").setup({ auto_install = true })
require("treesitter-context").setup()
