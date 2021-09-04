---- Compile on initialization, cleanup on quit
--vim.cmd[[augroup vimtex_event_1
--  au!
--  au User VimtexEventQuit     call vimtex#compiler#clean(0)
--  au User VimtexEventInitPost call vimtex#compiler#compile()
--augroup END
--]]
---- Close viewers on quit
--vim.cmd[[function! CloseViewers()
--  if executable('xdotool') && exists('b:vimtex')
--      \ && exists('b:vimtex.viewer') && b:vimtex.viewer.xwin_id > 0
--    call system('xdotool windowclose '. b:vimtex.viewer.xwin_id)
--  endif
--endfunction
--augroup vimtex_event_2
--  au!
--  au User VimtexEventQuit call CloseViewers()
--augroup END
--]]


--vim.cmd[[let g:vimtex_quickfix_ignore_filters = {'overfull' : 0, 'underfull' : 0}]]
-- vim.g.vimtex_fold_enabled = true
-- vim.g.vimtex_fold_manual = true
--vim.cmd[[let g:vimtex_view_method = 'skim']]
--
vim.cmd[[  augroup vimtex_config
    au!
    au User VimtexEventQuit call vimtex#compiler#clean(0)
  augroup END]]

vim.g.vimtex_view_method = 'skim'
--vim.g.vimtex_fold_enabled = 'true'
