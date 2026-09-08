vim.pack.add({
	"https://github.com/xiyaowong/transparent.nvim",
	"https://github.com/rose-pine/neovim",
	"https://github.com/tiesen243/vercel.nvim",
	"https://github.com/vague-theme/vague.nvim",
	"https://github.com/olivercederborg/poimandres.nvim",
	"https://github.com/ellisonleao/gruvbox.nvim",
})

require("rose-pine").setup({
		transparent = true,
		disable_background = true,
})
vim.cmd.colorscheme("rose-pine")

require("transparent").setup({
	groups = {
		"Normal",
		"NormalNC",
		"Comment",
		"Constant",
		"Special",
		"Identifier",
		"Statement",
		"PreProc",
		"Type",
		"Underlined",
		"Todo",
		"String",
		"Function",
		"Conditional",
		"Repeat",
		"Operator",
		"Structure",
		"LineNr",
		"NonText",
		"SignColumn",
		"StatusLine",
		"StatusLineNC",
		"EndOfBuffer",
		"TreesitterContext",
	},
	extra_groups = {
		"NormalFloat",
		"FloatBorder",
		"TelescopeNormal",
		"TelescopeBorder",
		"TelescopePromptNormal",
		"TelescopePromptBorder",
		"TelescopeResultsNormal",
		"TelescopePreviewNormal",
		"TabLine",
		"TabLineFill",
		"TabLineSel",
	},
	excludeGroups = {
		"CursorLine",
		"CursorLineNr",
	},
})

vim.opt.list = true
vim.opt.listchars = {
	lead = "·",
	tab = "→ ",
	trail = "·",
}
