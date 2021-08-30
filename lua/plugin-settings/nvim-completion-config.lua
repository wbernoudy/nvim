-- Use completion-nvim in every buffer
vim.cmd[[autocmd BufEnter * lua require'completion'.on_attach()]]

-- basic recommended settings
vim.cmd[[set completeopt=menu,noinsert,noselect]]
vim.cmd[[set completeopt=menuone,noinsert,noselect]]
----vim.cmd[[set shortmess+=c]]

---- Tab and Shift-Tab completion movement
vim.api.nvim_set_keymap('i', '<Tab>', '<C-n>', {noremap = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', '<C-p>', {noremap = true})

---- Have Tab and Shift-Tab call the completion menu if it is not up already
vim.cmd[[imap <tab> <Plug>(completion_smart_tab)]]
vim.cmd[[imap <s-tab> <Plug>(completion_smart_s_tab)]]

---- enable snippet support
vim.cmd[[let g:completion_enable_snippet = 'vim-vsnip']]

-- chain completion
vim.cmd[[
let g:completion_chain_complete_list = [{'complete_items': ['lsp', 'snippet']},{'mode': '<c-p>'},{'mode': '<c-n>'}]
]]

---- snippet completion
---- triggered on enter
vim.cmd[[let g:completion_confirm_key = "\<CR>"]]
