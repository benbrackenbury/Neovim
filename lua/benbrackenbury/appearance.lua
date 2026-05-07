vim.pack.add({
	"https://github.com/xiyaowong/transparent.nvim",
	"https://github.com/rose-pine/neovim",
	"https://github.com/tiesen243/vercel.nvim",
	"https://github.com/vague-theme/vague.nvim",
})

require("vercel").setup({
	transparent = true,
})
vim.cmd.colorscheme("vercel")

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
	excludeGroups = {
		"CursorLine",
		"CursorLineNr",
	},
})

vim.opt.list = true
vim.opt.listchars = {
  lead = "·",        -- only spaces before first char
  tab = "→ ",
  trail = "·",       -- optional: trailing spaces
}
vim.api.nvim_set_hl(0, "Whitespace", { fg = "#333333" })
vim.api.nvim_set_hl(0, "NonText", { fg = "#333333" })
