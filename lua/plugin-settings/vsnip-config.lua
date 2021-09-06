
------ Expand
vim.cmd[[imap <expr> <C-h> vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>']]
vim.cmd[[smap <expr> <C-h> vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>']]
--
---- Jump forward or backward
vim.cmd[[imap <expr> <C-k>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>']]
vim.cmd[[smap <expr> <C-k>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>']]
vim.cmd[[imap <expr> <C-j> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>']]
vim.cmd[[smap <expr> <C-j> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>']]

-- want a local directory for my snippets
vim.cmd[[let g:vsnip_snippet_dir = '~/.config/nvim/vsnip/']]
