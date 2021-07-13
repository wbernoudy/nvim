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
  call dein#add('lervag/vimtex')
  call dein#add('tpope/vim-surround')
  call dein#add('Raimondi/delimitMate')
  call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('scrooloose/nerdtree')
  "call dein#add('tmhedberg/SimpylFold')
  "call dein#add('Konfekt/FastFold')
"  call dein#add('Shougo/deoppet.nvim')

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
"

let g:python3_host_prog = '/Users/aaronslobodin/.pyenv/shims/python'
"set nofoldenable 
set foldmethod=marker

let g:vimtex_fold_enabled = 1
let g:vimtex_fold_types = {
	\ 'envs' : {
	\	'whitelist': ['enumerate','itemize','math','tikzpicture','tabular'],
	\ },
\ }

" ===== Nerd Tree =====
"map <C-n> :NERDTreeToggle<CR>

" ===== airline status bar =====
let g:airline#extensions#tabline#enabled = 1
" ===== COC =====
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Use Tab and shift-tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <Tab>' to make sure Tab is not mapped by other plugin.
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<S-j>" :
      \ coc#refresh()
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <space-space> for both expand and jump (make expand higher priority.)
"imap <space><space> <Plug>(coc-snippets-expand-jump)
"
"" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
"imap <C-j> <Plug>(coc-snippets-expand-jump)
imap <space><space> <Plug>(coc-snippets-expand-jump)

" Use C to open coc config
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
call SetupCommandAbbrs('C', 'CocConfig')

" ====== Solarized Colors =======
colorscheme solarized
set background=dark

" ====== LaTeX ======
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

"for spellchecking:
set spell
set spelllang=en_ca

"For navigating with wrapped lines:
"noremap k gk
"noremap j gj
"noremap 0 g0
"noremap $ g$

"autocmd Filetype tex inoremap ;u \={u}
"autocmd Filetype tex inoremap ;li \lim_{n \rightarrow \infty}
"autocmd Filetype tex inoremap ;s1i \sum_{n=1}^{\infty}

" ====== General ====== 
set showmatch
set ruler
set expandtab
set tabstop=4
set shiftwidth=4
set colorcolumn=120
set mouse=a
set ignorecase
set smartcase
set number 
set scrolloff=10
let g:AutofPairs = 0


" Start from last position when file was closed
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" navigating splits
" navigate up and down with Shift-j and Shift-k
" navigate left and right with Shift-h and Shift-l
nnoremap <S-j> <C-w><C-j>
nnoremap <S-k> <C-w><C-k>
nnoremap <S-l> <C-w><C-l>
nnoremap <S-h> <C-w><C-h>
nmap <C-l> :bn<CR>  " Next buffer in list
nmap <C-h> :bp<CR>  " Previous buffer in list
" make moving around splits easier
" open splits on the bottom and on the right
set splitbelow
set splitright













