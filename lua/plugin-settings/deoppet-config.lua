vim.cmd[[set runtimepath+=~/.config/nvim/neosnippet-snippets]]

vim.cmd[[call deoppet#initialize()]]
vim.cmd[[call deoppet#custom#option('snippets',map(globpath(&runtimepath, 'neosnippets', 1, 1), { _, val -> { 'path': val } }))]]
vim.cmd[[imap <C-k>  <Plug>(deoppet_expand)]]
vim.cmd[[imap <C-f>  <Plug>(deoppet_jump_forward)]]
vim.cmd[[imap <C-b>  <Plug>(deoppet_jump_backward)]]
vim.cmd[[smap <C-f>  <Plug>(deoppet_jump_forward)]]
vim.cmd[[smap <C-b>  <Plug>(deoppet_jump_backward)]]
