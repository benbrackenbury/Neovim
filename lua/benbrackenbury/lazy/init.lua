require('lazy').setup({
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "rose-pine/neovim",
    name = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  },
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/playground',
  'mbbill/undotree',
  'tpope/vim-fugitive',
  'github/copilot.vim',
  'ThePrimeagen/vim-be-good',
  'folke/tokyonight.nvim',
  'MunifTanjim/prettier.nvim',
  'jose-elias-alvarez/null-ls.nvim',
  'projekt0n/github-nvim-theme',
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
    }
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
})