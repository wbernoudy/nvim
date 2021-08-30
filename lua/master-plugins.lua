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

  -- PLUGINS

  -- latex
  use 'lervag/vimtex'
  require('plugin-settings.vimtex-config')

  -- language server protocol
  use 'neovim/nvim-lspconfig'

  -- package manager for the language servers
  -- remember, after using :LspInstall <language> to add the appropriate config file under
  -- .config/nvim/lua/lsp/language-lsp.lua and include require'lspconfig'.<language>.setup{}
  -- then add require('lsp/<language>')
  use 'kabouzeid/nvim-lspinstall'
  require('plugin-settings.lspinstall-config')

  -- completion
  use 'nvim-lua/completion-nvim'
  require('plugin-settings.nvim-completion-config')
  --use 'hrsh7th/nvim-compe'
  --require('plugin-settings.compe-config')
  -- add pictograms to completion
  --use 'onsails/lspkind-nvim'

  -- snippets
  use 'hrsh7th/vim-vsnip'
  require('plugin-settings.vsnip-config')

  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
      -- TSInstall <whatever language I want to install>
  }
  require('plugin-settings.treesitter-config')

  -- colour
  use "Pocco81/Catppuccino.nvim"
  require('plugin-settings.catppuccino-config')
  --use 'overcache/NeoSolarized'
  ---- Terminal colours
  --vim.o.termguicolors = true
  --vim.g.colors_name = 'NeoSolarized'

  --use 'altercation/vim-colors-solarized'
  --require('plugin-settings.solarized-config')

  -- status line
  use {
  'hoob3rt/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true}}
  require('plugin-settings.lualine-config')

  -- icons
  use 'kyazdani42/nvim-web-devicons'

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  require('plugin-settings.telescope-config')


  -- folding
  --use 'Konfekt/FastFold'
  --require('plugin-settings.fastfold-config')

  end)



