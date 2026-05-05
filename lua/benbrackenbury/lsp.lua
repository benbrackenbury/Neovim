vim.pack.add({
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	"https://github.com/stevearc/conform.nvim",
})

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"intelephense",
		"ts_ls",
		"gopls",
	},
})

require("conform").setup({
	formatters_by_ft = {
		php = { "pint" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		ruby = { "rubocop" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		go = { "gofumpt" },
		html = { "prettier" },
		lua = { "stylua" },
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

vim.lsp.config("intelephense", {
	settings = {
		intelephense = {
			stubs = {
				"wordpress",
				"woocommerce",
				"acf-pro",
				"wordpress-globals",
				"wp-cli",
			},
		},
	},
})

vim.lsp.config("emmet_language_server", {
  filetypes = {
    'blade',
    'php',
  },
})
