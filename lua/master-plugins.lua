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
  -- Install nvim-cmp, and buffer source as a dependency
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-calc",
      "kdheepak/cmp-latex-symbols",
      "f3fora/cmp-spell",
    }
  }
  require('plugin-settings.cmp-config')

  -- snippets
  use 'hrsh7th/vim-vsnip'
  require('plugin-settings.vsnip-config')

  -- treesitter
--  use {'nvim-treesitter/nvim-treesitter',
--      run = ':TSUpdate'
--      -- TSInstall <whatever language I want to install>
--  }
  --  require('plugin-settings.treesitter-config')
--  use {'nvim-treesitter/completion-treesitter'}
  -- spell checker
--  use {'lewis6991/spellsitter.nvim'}
--  require('plugin-settings.spellsitter-config')

  -- colour
  vim.o.syntax = 'on'
  vim.o.termguicolors = true
  use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  vim.o.background = "dark" -- or "light" for light mode
  vim.cmd([[colorscheme gruvbox]])

  --use 'folke/tokyonight.nvim'
  --vim.cmd[[colorscheme tokyonight]]

  --use 'shaunsingh/nord.nvim'
  --vim.cmd[[colorscheme nord]]

  --use 'sainnhe/gruvbox-material'
  --require('plugin-settings.gruvboxcolor-config')

  --use "Pocco81/Catppuccino.nvim"
  --require('plugin-settings.catppuccino-config')

  --use 'overcache/NeoSolarized'
  ---- Terminal colours
  --vim.o.termguicolors = true
  --vim.g.colors_name = 'NeoSolarized'

  --use 'altercation/vim-colors-solarized'
  --require('plugin-settings.solarized-config')

  --use 'romainl/flattened'
  --vim.cmd[[color flattened_dark]]

  --use 'ishan9299/nvim-solarized-lua'
  --vim.cmd('colorscheme solarized-flat')

  -- status line
  use {'hoob3rt/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true}}
  require('plugin-settings.lualine-config')

  -- telescope
  use {'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  require('plugin-settings.telescope-config')

  -- motion
  use 'ggandor/lightspeed.nvim'
  require('plugin-settings.lightspeed-config')

  -- file explorer
  use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons'
  }
  require('plugin-settings.nvimtree-config')


  -- folding
  --use 'Konfekt/FastFold'
  --require('plugin-settings.fastfold-config')

  end)




