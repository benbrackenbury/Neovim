vim.pack.add({
	"https://github.com/xiyaowong/transparent.nvim",
})

-- Use the terminal's 16 ANSI colors instead of a GUI colorscheme.
vim.cmd.colorscheme("vim")

-- `vim` uses reverse video for chrome; that paints the terminal fg as a solid bar.
local chrome = {
	"StatusLine",
	"StatusLineNC",
	"StatusLineTerm",
	"StatusLineTermNC",
	"TabLine",
	"TabLineFill",
	"TabLineSel",
	"WinSeparator",
	"VertSplit",
	"WinBar",
	"WinBarNC",
	"MsgSeparator",
}

local function clear_chrome()
	for _, group in ipairs(chrome) do
		vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
	end
	vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", ctermbg = "NONE", bold = true })
	vim.api.nvim_set_hl(0, "TabLineSel", { bg = "NONE", ctermbg = "NONE", bold = true })
	-- ANSI 8 (bright black) so the current line is a block, not an underline.
	vim.api.nvim_set_hl(0, "CursorLine", { ctermbg = 8, underline = false })
	vim.api.nvim_set_hl(0, "CursorLineNr", { ctermbg = 8, bold = true, underline = false })
end

vim.g.transparent_enabled = true
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
		"WinSeparator",
		"VertSplit",
		"WinBar",
		"WinBarNC",
		"NeoTreeNormal",
		"NeoTreeNormalNC",
		"NeoTreeEndOfBuffer",
	},
	excludeGroups = {
		"CursorLine",
		"CursorLineNr",
	},
	on_clear = clear_chrome,
})
clear_chrome()

vim.opt.list = true
vim.opt.listchars = {
	lead = "·",
	tab = "→ ",
	trail = "·",
}
