-- Automatically install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Automatically sync plugins
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Plugins
return require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'
  -- Plenary
  use 'nvim-lua/plenary.nvim'
  -- Colorscheme
  use 'RRethy/nvim-base16'
  -- Comment
  use 'numToStr/Comment.nvim'
  -- Visualize indentation
  use "lukas-reineke/indent-blankline.nvim"
  -- File explorer
  use 'cocopon/vaffle.vim'
  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  -- Icons
  use 'onsails/lspkind.nvim'
  -- Fuzzy finding
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.8' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- Completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  -- LSP settings
  use 'neovim/nvim-lspconfig'
  -- LSP management
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  -- Editorconfig
  use 'gpanders/editorconfig.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
