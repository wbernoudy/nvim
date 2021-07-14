vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<', '>gv', {noremap = true, silent = true})

-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- navigation with wrapped lines
vim.api.nvim_set_keymap('n', 'k', 'gk', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', 'gj', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '0', 'g0', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '$', 'g$', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
--vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv\'', {noremap = true, silent = true})
--vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv\'', {noremap = true, silent = true})
