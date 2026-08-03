vim.pack.add({
	"https://github.com/xiyaowong/transparent.nvim",
	"https://github.com/kepano/flexoki-neovim",
	"https://github.com/f-person/auto-dark-mode.nvim",
	"https://github.com/rose-pine/neovim",
	"https://github.com/tiesen243/vercel.nvim",
	"https://github.com/vague-theme/vague.nvim",
	"https://github.com/olivercederborg/poimandres.nvim",
})

local function set_dark()
	vim.api.nvim_set_option_value("background", "dark", {})
	vim.cmd.colorscheme("flexoki-dark")
end

local function set_light()
	vim.api.nvim_set_option_value("background", "light", {})
	vim.cmd.colorscheme("flexoki-light")
end

-- Apply immediately so UI isn't unthemed before the first OS poll
set_dark()

require("auto-dark-mode").setup({
	set_dark_mode = set_dark,
	set_light_mode = set_light,
	update_interval = 3000,
	fallback = "dark",
})

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
	lead = "·",
	tab = "→ ",
	trail = "·",
}
