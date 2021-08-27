vim.o.mouse='a'                             -- Enable your mouse
vim.o.ruler = true
vim.o.shiftwidth = 4                        -- Change the number of space characters inserted for indentation
vim.o.tabstop = 4
--vim.o.relativenumber = true                             -- Line numbers
vim.cmd[[set number relativenumber]]
vim.cmd[[set cursorline]]
vim.o.expandtab = true
vim.smartcase = true
vim.o.ignorecase = true
vim.cmd[[set spell]]
vim.cmd[[set spelllang=en_ca]]
-- start at the same point in the file as before
vim.cmd[[autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]
