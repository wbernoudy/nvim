-- make startup faster
require('impatient').enable_profile()

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
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-vsnip",
      "kdheepak/cmp-latex-symbols",
    }
  }
  require('plugin-settings.cmp-config')

  -- language server protocol
  use 'neovim/nvim-lspconfig'

  -- package manager for the language servers
  -- remember, after using :LspInstall <language> to add the appropriate config file under
  use 'williamboman/nvim-lsp-installer'
  require('plugin-settings/nvim-lsp-installer-config')

  -- treesitter
  use {'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
      -- TSInstall <whatever language I want to install>
  }
  require('plugin-settings.treesitter-config')

  -- latex
  use 'lervag/vimtex'
  require('plugin-settings.vimtex-config')
  -- this plugin is indev and I would eventually like it once it is stable
--  use 'brymer-meneses/grammar-guard.nvim'
--  require("grammar-guard").init()

  -- snippets
  use 'hrsh7th/vim-vsnip'
  require('plugin-settings.vsnip-config')

  -- status line
  use {'hoob3rt/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true}}
  require('lualine').setup{}
  --require('plugin-settings.lualine-config')

  -- motion
  use 'ggandor/lightspeed.nvim'
--  require('plugin-settings.lightspeed-config')

  -- file explorer
  use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require'nvim-tree'.setup {} end
  }
  require('plugin-settings.nvimtree-config')

  -- benchmarking

  -- Is using a standard Neovim install, i.e. built from source or using a
  -- provided appimage.
  use 'lewis6991/impatient.nvim'

  -- colour
  use 'ajmwagar/vim-deus'
 require('plugin-settings.deuscolor-config')

  end}
)


  --use 'EdenEast/nightfox.nvim'
--use 'sainnhe/gruvbox-material'
  --use 'EdenEast/nightfox.nvim'
  --require('github-theme').setup()

-- A bunch of things I have played with but am not currently using
---- telescope
--use {'nvim-telescope/telescope.nvim',
--  requires = { {'nvim-lua/plenary.nvim'} }
--}
--require('plugin-settings.telescope-config')

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

--  use 'ms-jpq/coq_nvim'
--  use 'ms-jpq/coq.thirdparty'
--  require("coq_3p") {
--  { src = "nvimlua", short_name = "nLUA" },
--  { src = "vimtex", short_name = "vTEX" },
--  { src = "bc", short_name = "MATH", precision = 6 }
--}
--  vim.g.coq_settings = {
--    auto_start = 'shut-up',
--  }
--
 -- turn off lsp diagnostics because it is annoying and not needed
--use'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
--require'toggle_lsp_diagnostics'.init({ start_on = false })

--  use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
--  use 'sainnhe/gruvbox-material'
--  require('plugin-settings.gruvboxcolor-config')


