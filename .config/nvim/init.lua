vim.cmd[[packloadall]]

require'plugins'
require'editor'
require'workspace'
require'theme'

vim.o.mouse='a'
vim.o.title=true
vim.o.wildmode=[[list:longest]]
vim.o.modeline=true

vim.g.mapleader=','
