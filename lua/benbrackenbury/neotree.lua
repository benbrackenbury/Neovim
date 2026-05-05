vim.pack.add({
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3')
  },
  -- dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
})
require("neo-tree").setup({
  close_if_last_window = true,
  filesystem = {
	  use_libuv_file_watcher = true,
	  follow_current_file = {
		  enabled = true,
	  }
  },
})
vim.keymap.set("n", "<leader>e", "<CMD>Neotree toggle action=show<CR>")
vim.keymap.set("n", "<leader>E", "<CMD>Neotree<CR>")

