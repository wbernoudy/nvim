-- Expand or jump
vim.cmd[[imap <expr> <space><space>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]
vim.cmd[[smap <expr> <space><space>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]

---- Jump forward or backward
vim.cmd[[imap <expr> <C-space> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>']]
vim.cmd[[smap <expr> <C-space> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>']]

--  local directory for my snippets
vim.cmd[[let g:vsnip_snippet_dir = '~/.config/nvim/vsnip/']]
