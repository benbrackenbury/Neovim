-- Neovim core probes terminal bg via OSC 11 + DSR *before* user config
-- (vim._core.defaults). On SSH/remote that often fails and leaves a WARN via
-- nvim_echo. Config cannot prevent that emit; we scrub it from history +
-- cmdline as early as possible. (auto-dark-mode is unrelated and is skipped
-- entirely on unsupported environments — see appearance.lua.)
do
	local dsr_pat = "Did not detect DSR response"

	local function is_dsr_warning(msg)
		return type(msg) == "string" and msg:find(dsr_pat, 1, true) ~= nil
	end

	local notify = vim.notify
	---@param msg string|string[]|number
	vim.notify = function(msg, level, opts)
		if is_dsr_warning(msg) then
			return
		end
		return notify(msg, level, opts)
	end

	-- Also filter nvim_echo in case anything re-emits the same text.
	local echo = vim.api.nvim_echo
	vim.api.nvim_echo = function(chunks, history, opts)
		if type(chunks) == "table" then
			for _, chunk in ipairs(chunks) do
				if type(chunk) == "table" and is_dsr_warning(chunk[1]) then
					return
				end
			end
		end
		return echo(chunks, history, opts)
	end

	local function scrub_dsr_warning()
		local ok, messages = pcall(vim.fn.execute, "messages")
		if ok and type(messages) == "string" and messages:find(dsr_pat, 1, true) then
			pcall(vim.cmd, "silent! messages clear")
		end
		-- Clear cmdline leftover from the prior nvim_echo
		pcall(echo, { { "" } }, false, {})
		pcall(vim.cmd, "redraw!")
	end

	-- Immediate + again after UI settles (defaults already echoed it).
	scrub_dsr_warning()
	vim.api.nvim_create_autocmd({ "UIEnter", "VimEnter" }, {
		once = true,
		callback = scrub_dsr_warning,
	})
	vim.schedule(scrub_dsr_warning)
end

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
