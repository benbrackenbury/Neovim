-- System appearance probing only works on a real desktop session. Skip entirely
-- over SSH, tty-only, containers, and hosts without a desktop portal/query tool.
local function can_detect_appearance()
	if
		vim.env.SSH_CONNECTION
		or vim.env.SSH_CLIENT
		or vim.env.SSH_TTY
		or vim.env.REMOTE_CONTAINERS
		or vim.env.CODESPACES
		or vim.env.VSCODE_INJECTION
	then
		return false
	end

	-- Pure tty login (no graphical session) — portal/query will fail.
	if vim.env.XDG_SESSION_TYPE == "tty" then
		return false
	end

	local uname = vim.uv.os_uname()
	local sys = uname.sysname

	if string.match(uname.release, "WSL") then
		return true
	end
	if sys == "Linux" then
		if vim.fn.executable("dbus-send") == 0 then
			return false
		end
		-- Need a session bus / display for org.freedesktop.appearance
		if not vim.env.DISPLAY and not vim.env.WAYLAND_DISPLAY then
			return false
		end
		return true
	end
	if sys == "Darwin" or sys == "Windows_NT" then
		return true
	end
	return false
end

local packs = {
	"https://github.com/xiyaowong/transparent.nvim",
	"https://github.com/kepano/flexoki-neovim",
	"https://github.com/rose-pine/neovim",
	"https://github.com/tiesen243/vercel.nvim",
	"https://github.com/vague-theme/vague.nvim",
	"https://github.com/olivercederborg/poimandres.nvim",
}

-- Only install/load auto-dark-mode when the environment can support it.
if can_detect_appearance() then
	table.insert(packs, "https://github.com/f-person/auto-dark-mode.nvim")
end

vim.pack.add(packs)

local function set_dark()
	vim.api.nvim_set_option_value("background", "dark", {})
	vim.cmd.colorscheme("flexoki-dark")
end

local function set_light()
	vim.api.nvim_set_option_value("background", "light", {})
	vim.cmd.colorscheme("flexoki-light")
end

-- Always start dark: remote/SSH, failed terminal DSR, and pre-poll UI.
set_dark()

if can_detect_appearance() then
	local ok, adm = pcall(require, "auto-dark-mode")
	if ok then
		adm.setup({
			set_dark_mode = set_dark,
			set_light_mode = set_light,
			update_interval = 3000,
			fallback = "dark",
		})
	end
end

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
