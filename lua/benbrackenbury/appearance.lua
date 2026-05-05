vim.pack.add({
	"https://github.com/xiyaowong/transparent.nvim",
	"https://github.com/rose-pine/neovim",
})

vim.pack.add({ 'https://github.com/vague-theme/vague.nvim' })
vim.cmd.colorscheme('vague')

require("transparent").setup({
	groups = {
		'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
		'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
		'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
		'SignColumn', 'StatusLine', 'StatusLineNC',
		'EndOfBuffer', 'TreesitterContext'
	},
	excludeGroups = {
		'CursorLine',
		'CursorLineNr',
	}
})
