vim.pack.add({ "https://github.com/nvim-telescope/telescope.nvim" })

require("telescope").setup({
	defaults = {
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
			},
		},
		sorting_strategy = "ascending",
	},
})
