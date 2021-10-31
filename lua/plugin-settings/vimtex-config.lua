-- cleanup when closing nvim session
vim.cmd[[  augroup vimtex_config
    au!
    au User VimtexEventQuit call vimtex#compiler#clean(0)
  augroup END]]

-- set default pdf viewer
vim.g.vimtex_view_method = 'skim'

-- trying to make things faster
vim.g.vimtex_matchparen_enabled = 0

-- folding
vim.g.vimtex_fold_enabled = 1
-- how to fold
-- zc close fold
-- zo open fold
-- zC close ALL folds at this spot
-- zO open ALL folds at this spot
-- zM fold everything in buffer
-- zR unfold everything in buffer


-- quickfix window options
--vim.cmd[[let g:vimtex_quickfix_ignore_filters = {'overfull' : 0, 'underfull' : 0}]]


