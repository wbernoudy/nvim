local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Plugins
  -- latex
  use 'lervag/vimtex'
--  use 'kyazdani42/nvim-tree.lua'
  -- language server protocol
  use 'neovim/nvim-lspconfig'
  -- completion
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
  use 'Shougo/deoppet.nvim'
  -- add pictograms to completion
  use 'onsails/lspkind-nvim'
  -- package manager for the language servers
  -- remember, after using :LspInstall <language> to add the appropriate config file under
  -- .config/nvim/lua/lsp/language-lsp.lua and include require'lspconfig'.<language>.setup{}
  -- then add require('lsp/<language>')
  use 'kabouzeid/nvim-lspinstall'
  -- colour
  use 'altercation/vim-colors-solarized'
  -- See https://github.com/nvim-treesitter/nvim-treesitter#supported-languages for languages supported
--  use {'nvim-treesitter/nvim-treesitter', run= ':TSUpdate'}
end)

