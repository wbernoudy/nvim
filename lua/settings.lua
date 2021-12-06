-- vim.o is global variable
-- vim.bo is buffer variable
-- vim.wo is window variable
-- use :help {thing} to find out what type of variable it is in the documentation

-- Mouse
vim.o.mouse='a'

-- Tabbing behavior
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
--vim.bo.softtabstop = 4

-- hybrid of relative number line and true number line
-- removing these makes nvim faster
vim.wo.relativenumber = false
vim.wo.number = false

-- Cursor line
-- removing the cursorline makes nvim faster
vim.wo.cursorline = false

-- start at the same point in the file as before
vim.cmd[[autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]

vim.o.smartcase = false

-- does this make things faster
vim.o.showmatch = false

-- spell checking ## treesitter now manages this
--vim.o.spell = true
--vim.o.spelllang = 'en_ca'

-- scrolling options
vim.g.scrolloff = 5


