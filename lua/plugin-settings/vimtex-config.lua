-- cleanup when closing nvim session
vim.cmd[[  augroup vimtex_config
    au!
    au User VimtexEventQuit call vimtex#compiler#clean(0)
  augroup END]]

-- set default pdf viewer
vim.g.vimtex_view_method = 'skim'

-- folding
--vim.g.vimtex_fold_enabled = 'true'

-- quickfix window options
--vim.cmd[[let g:vimtex_quickfix_ignore_filters = {'overfull' : 0, 'underfull' : 0}]]
-- vim.g.vimtex_fold_enabled = true
-- vim.g.vimtex_fold_manual = true
--vim.cmd[[let g:vimtex_view_method = 'skim']]


