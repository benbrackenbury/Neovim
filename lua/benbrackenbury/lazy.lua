-- bootstrap lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    requires = { 'nvim-lua/plenary.nvim' }
  },
  {
    "rose-pine/neovim",
    as = 'rose-pine',
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
    requires = {
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