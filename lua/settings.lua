-- vim.o is global variable
-- vim.bo is buffer variable
-- vim.wo is window variable
-- use :help {thing} to find out what type of variable it is in the documentation

-- Mouse
vim.o.mouse='a'

-- Tabbing behavior
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4

-- hybrid of relative number line and true number line
vim.wo.relativenumber = true
vim.wo.number = true

-- Cursor line
vim.wo.cursorline = true

-- start at the same point in the file as before
vim.cmd[[autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]

vim.o.smartcase = true

--vim.o.spell = true
--vim.o.ruler = true
