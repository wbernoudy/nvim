-- make startup faster
require('impatient').enable_profile()

local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup({function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- PLUGINS --

  --completion
  --Install nvim-cmp and sources
  use {'hrsh7th/nvim-cmp',
    requires = {
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip-integ",
      "kdheepak/cmp-latex-symbols",
    },
    config = function()
        require('plugin-settings.cmp-config')
    end
  }

  -- language server protocol
  use 'neovim/nvim-lspconfig'

  -- package manager for the language servers
  -- remember, after using :LspInstall <language> to add the appropriate config file under
  use {'williamboman/nvim-lsp-installer',
    config = function()
        require('plugin-settings/nvim-lsp-installer-config')
    end
  }

  -- treesitter
  -- TSInstall <whatever language I want to install>
  use {'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
          require('plugin-settings.treesitter-config')
      end
  }

  -- latex
  use {'lervag/vimtex',
      config = function()
          require('plugin-settings.vimtex-config')
      end
  }

  -- this plugin is indev and I would eventually like it once it is stable
  --  use 'brymer-meneses/grammar-guard.nvim'
  --  require("grammar-guard").init()

  -- snippets
  use {'hrsh7th/vim-vsnip',
      config = function()
          require('plugin-settings.vsnip-config')
      end
  }

  -- snippet repository
  use "rafamadriz/friendly-snippets"

  -- status line
  use {'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
      config = function()
          require('lualine').setup{}
      end
  }

  -- motion
  use 'ggandor/lightspeed.nvim'

  -- file explorer
  use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
          require'nvim-tree'.setup {}
          require('plugin-settings.nvimtree-config')
      end
  }

  -- make startup faster
  use 'lewis6991/impatient.nvim'

  -- colorscheme
  use "rebelot/kanagawa.nvim"

  -- benchmarking
  use 'tweekmonster/startuptime.vim'

  -- the default filetype plugin for nvim is slow, use this one for nvim 0.6 or greater
  use {"nathom/filetype.nvim"}

  -- commenting commands
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  -- fuzzy search with fzf
  use { 'ibhagwan/fzf-lua',
      -- optional for icon support
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function()
          require('plugin-settings.fzf-lua-config')
      end
  }

  -- see and search clipboard history
  use {
      "AckslD/nvim-neoclip.lua",
      requires = {
          {'tami5/sqlite.lua', module = 'sqlite'},
          -- you'll need at least one of these
          -- {'nvim-telescope/telescope.nvim'},
          {'ibhagwan/fzf-lua'}
      },
      config = function()
          require('neoclip').setup({
              default_register = '+',
          })
      end,
  }

  -- quickly navigate errors/warnings
  use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
          require('plugin-settings.trouble-config')
      end
  }

  -- continue to show function signature hint and highlight current argument
  use {
      "ray-x/lsp_signature.nvim",
      config = function()
          require "lsp_signature".setup()
      end,
  }

  -- easily modify matching "surroundings"
  use {
      "blackCauldron7/surround.nvim",
      config = function()
          require"surround".setup {mappings_style = "surround"}
      end
  }

  use {"tpope/vim-fugitive"}

  end,

  -- Move to lua dir so impatient.nvim can cache it
  config = {
      compile_path = vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua'

  }
}
)
