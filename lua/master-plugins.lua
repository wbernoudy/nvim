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

  -- PLUGINS --

  -- latex
  use 'lervag/vimtex'
  require('plugin-settings.vimtex-config')

  -- language server protocol
  use 'neovim/nvim-lspconfig'

  -- package manager for the language servers
  -- remember, after using :LspInstall <language> to add the appropriate config file under
  use 'kabouzeid/nvim-lspinstall'
  require('plugin-settings.lspinstall-config')

 --completion
 --Install nvim-cmp, and buffer source as a dependency
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-omni",
      "kdheepak/cmp-latex-symbols",
      "f3fora/cmp-spell",
    }
  }
  require('plugin-settings.cmp-config')

  -- snippets
  use 'hrsh7th/vim-vsnip'
  require('plugin-settings.vsnip-config')

  -- colour
  use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  require('plugin-settings.gruvboxcolor-config')

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
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require'nvim-tree'.setup {} end
  }
  require('plugin-settings.nvimtree-config')

  end)

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




--  use 'ms-jpq/coq_nvim'
--  use 'ms-jpq/coq.thirdparty'
--require("coq_3p") {
--  { src = "vimtex", short_name = "vTEX" },
--{ src = "bc", short_name = "MATH", precision = 6 }
--}
--vim.g.coq_settings = {
--  auto_start = 'shut-up',
--}
--

--  use 'nvim-lua/completion-nvim'
--vim.cmd[[autocmd BufEnter * lua require'completion'.on_attach()]]
--  vim.cmd[[
--" Use <Tab> and <S-Tab> to navigate through popup menu
--inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
--inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
--
--" Set completeopt to have a better completion experience
--set completeopt=menuone,noinsert,noselect
--
--" Avoid showing message extra message when using completion
--set shortmess+=c
--let g:completion_enable_auto_popup = 1
--let g:completion_enable_snippet = 'vim-vsnip'
--imap <tab> <Plug>(completion_smart_tab)
--imap <s-tab> <Plug>(completion_smart_s_tab)
--  ]]

