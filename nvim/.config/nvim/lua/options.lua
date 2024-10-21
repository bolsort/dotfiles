vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- Navigate 
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.wo.number = true
vim.wo.relativenumber = true

vim.api.nvim_set_option("clipboard","unnamed") -- Yank to system clipboard
