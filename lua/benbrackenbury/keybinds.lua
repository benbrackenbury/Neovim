vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>oo", "<CMD>Oil<CR>")
vim.keymap.set("n", "<leader>ot", "<CMD>tab Oil<CR>")
vim.keymap.set("n", "<leader>ov", "<CMD>vert Oil<CR>")
vim.keymap.set("n", "<leader>oh", "<CMD>belowright Oil<CR>")
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", "<CMD>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>i", function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
end)
vim.keymap.set("n", "<leader>fd", function()
		require("telescope.builtin").diagnostics({ severity_limit = "Error" })
end)
vim.keymap.set("n", "<leader>fD", "<CMD>Telescope diagnostics<CR>")
vim.keymap.set("n", "<leader>d", function()
		vim.diagnostic.setqflist({ open = true, severity = vim.diagnostic.severity.ERROR })
end)
vim.keymap.set("n", "<leader>D", function()
		vim.diagnostic.setqflist({ open = true })
end)
vim.keymap.set("i", "jk", "<esc>l")
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>fm", function()
		require("conform").format({ async = true })
end)
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "<leader>vrc", "<CMD>tabe ~/.config/nvim/init.lua<CR>")
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>yef", "<CMD>!cat % | pbcopy<CR>")

vim.keymap.set("n", "<leader>H", "<CMD>diffget //2<CR>")
vim.keymap.set("n", "<leader>L", "<CMD>diffget //3<CR>")

vim.keymap.set("n", "<F9>", function()
		vim.cmd("!%:p")
end)

-- herdr vim-navigator (mirror of vim-tmux-navigator): herdr's nav plugin
-- forwards ctrl+hjkl here when this pane runs nvim; move between nvim
-- windows first, cross to the neighboring herdr pane at the edge.
if vim.env.HERDR_PANE_ID then
  local function nav(wincmd_dir, herdr_dir)
    return function()
      local before = vim.api.nvim_get_current_win()
      vim.cmd('wincmd ' .. wincmd_dir)
      if vim.api.nvim_get_current_win() == before then
        vim.system({ 'herdr', 'pane', 'focus', '--direction', herdr_dir, '--pane', vim.env.HERDR_PANE_ID })
      end
    end
  end
  vim.keymap.set('n', '<C-h>', nav('h', 'left'),  { desc = 'Window/pane left' })
  vim.keymap.set('n', '<C-j>', nav('j', 'down'),  { desc = 'Window/pane down' })
  vim.keymap.set('n', '<C-k>', nav('k', 'up'),    { desc = 'Window/pane up' })
  vim.keymap.set('n', '<C-l>', nav('l', 'right'), { desc = 'Window/pane right' })
end
