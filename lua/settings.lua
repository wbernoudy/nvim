-- vim.o is global variable
-- vim.bo is buffer variable
-- vim.wo is window variable
-- use :help {thing} to find out what type of variable it is in the documentation

-- Mouse
vim.o.mouse = 'a'

-- Tabbing behavior
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4

-- start at the same point in the file as before
vim.cmd[[autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]

-- scrolling options
vim.g.scrolloff = 5

-- right most diagnostic column
vim.o.scl = 'no'

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.undodir = vim.fn.stdpath('data')..'/undo'
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

vim.opt.clipboard = {'unnamed', 'unnamedplus'}

vim.opt.number = true
vim.opt.ruler = true
vim.opt.colorcolumn = '88'

vim.o.showmatch = true

vim.cmd("colorscheme kanagawa")
