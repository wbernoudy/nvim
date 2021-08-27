set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/deoppet.nvim
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
