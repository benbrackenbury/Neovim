return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = function()
    require('oil').setup({})
    vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open Oil in floating window" })
    vim.keymap.set("n", "<leader>oo", "<CMD>Oil<CR>", { desc = "Open Oil in current buffer" })
    vim.keymap.set("n", "<leader>ot", "<CMD>tab Oil<CR>", { desc = "Open Oil in new tab" })
    vim.keymap.set("n", "<leader>ov", "<CMD>vert Oil<CR>", { desc = "Open Oil in split to the left" })
    vim.keymap.set("n", "<leader>oh", "<CMD>belowright Oil<CR>", { desc = "Open Oil in split to the bottom" })
  end,
}
