"dein Scripts-----------------------------
set nocompatible               " Be iMproved

" Required:
set runtimepath+=/Users/aaronslobodin/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/aaronslobodin/.local/share/dein')
  call dein#begin('/Users/aaronslobodin/.local/share/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/aaronslobodin/.local/share/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('altercation/vim-colors-solarized')
"  call dein#add('lervag/vimtex')
"  call dein#add('vim-airline/vim-airline')
"  call dein#add('vim-airline/vim-airline-themes')
"  call dein#add('Shougo/deoppet.nvim')
"  call dein#add('nvim-lua/completion-nvim')
"  call dein#add('nvim-lua/popup.nvim')
"  call dein#add('nvim-lua/plenary.nvim')
"  call dein#add('nvim-telescope/telescope.nvim')
  call dein#add('hrsh7th/nvim-compe')
"  call dein#add('GoldsteinE/compe-latex-symbols')
"  call dein#add('neovim/nvim-lspconfig')
"  call dein#add('Shougo/deoplete.nvim')
"  if !has('nvim')
"    call dein#add('roxma/nvim-yarp')
"    call dein#add('roxma/vim-hug-neovim-rpc')
"  endif
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
set
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })




" BASIC SETTINGS
set foldmethod=marker
"for spellchecking:
set spell
set spelllang=en_ca
"set showmatch
set ruler
set expandtab
set tabstop=4
set shiftwidth=4
set colorcolumn=120
set mouse=a
set ignorecase
set smartcase
set relativenumber 
let g:AutofPairs = 0
" Start from last position when file was closed
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
"For navigating with wrapped lines:
noremap k gk
noremap j gj
noremap 0 g0
noremap $ g$

""" DEOPLETE
"let g:deoplete#enable_at_startup = 1
""call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
""call deoplete#custom#var('omni', 'input_patterns', {
""        \ 'tex': g:vimtex#re#deoplete
""        \})
"call deoplete#custom#source('deoppet', 'rank', 9999)

" COMPLETION
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
"let g:compe.source.vsnip = v:true
"let g:compe.source.ultisnips = v:true
"let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true
" for vimtex autocomplete
"let g:compe.source.omni = { 'filetypes': ['tex'] }
"let g:compe.source.latex_symbols = v:true

" PYTHON
let g:python3_host_prog = '/Users/aaronslobodin/.pyenv/shims/python'

" COLOUR SCHEME
colorscheme solarized
set background=dark

" AIRLINE STATUS BAR
let g:airline#extensions#tabline#enabled = 1

" VIMTEX
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_types = {
	\ 'envs' : {
	\	'whitelist': ['enumerate','itemize','math','tikzpicture','tabular'],
	\ },
\ }
" Ensure that nvim reads files ending in .tex as tex files rather than
" plaintext files
let g:tex_flavor='latex'
"let g:vimtex_compiler_progname= 'nvr'
" matching deoplete with LaTeX commands 
"let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
" Define PDF viewer
let g:vimtex_view_method = 'skim'
" I have opted for non-continuous complilations of docs. 
let g:vimtex_compiler_latexmk = {
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
\}
" Nvim automatically jumps to the first error if there is an error in writeup
let g:vimtex_quickfix_autoclose_after_keystrokes = 1
" Controls the behaviour of the quickfix window that appears in case of errors
let g:vimtex_quickfix_mode =1 
" errors to ignore
let g:vimtex_quickfix_ignore_filters = {
      \ 'overfull' : 0,
       \ 'underfull' : 0,
\}
" Compile on initialization, cleanup on quit
augroup vimtex_event_1
  au!
  au User VimtexEventQuit     call vimtex#compiler#clean(0)
  au User VimtexEventInitPost call vimtex#compiler#compile()
augroup END
" Close viewers on quit
function! CloseViewers()
  if executable('xdotool') && exists('b:vimtex')
      \ && exists('b:vimtex.viewer') && b:vimtex.viewer.xwin_id > 0
    call system('xdotool windowclose '. b:vimtex.viewer.xwin_id)
  endif
endfunction
augroup vimtex_event_2
  au!
  au User VimtexEventQuit call CloseViewers()
augroup END

" DEOPPET
set runtimepath+=~/.config/nvim/neosnippet-snippets
call deoppet#initialize()
call deoppet#custom#option('snippets',
      \ map(globpath(&runtimepath, 'neosnippets', 1, 1),
      \     "{ 'path': v:val }"))

imap <C-k>  <Plug>(deoppet_expand)
imap <C-f>  <Plug>(deoppet_jump_forward)
imap <C-b>  <Plug>(deoppet_jump_backward)
smap <C-f>  <Plug>(deoppet_jump_forward)
smap <C-b>  <Plug>(deoppet_jump_backward)


" navigating splits
" navigate up and down with Shift-j and Shift-k
" navigate left and right with Shift-h and Shift-l
"nnoremap <S-j> <C-w><C-j>
"nnoremap <S-k> <C-w><C-k>
"nnoremap <S-l> <C-w><C-l>
"nnoremap <S-h> <C-w><C-h>
"nmap <C-l> :bn<CR>  " Next buffer in list
"nmap <C-h> :bp<CR>  " Previous buffer in list
"" make moving around splits easier
"" open splits on the bottom and on the right
"set splitbelow
"set splitright













