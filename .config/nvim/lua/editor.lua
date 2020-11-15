local M = {}

------ Completion
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.completeopt='menuone,noinsert,noselect'

vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {expr = true})

------ LSP
vim.cmd [[packadd nvim-lspconfig]]
local lsp = require('nvim_lsp')

local function on_attach(client) 
	require'completion'.on_attach(client)
	require'diagnostic'.on_attach(client)
end

require('nlua.lsp.nvim').setup(lsp, {on_attach = on_attach})
lsp.vimls.setup({on_attach=on_attach})

------ Format
function M.Format()
	vim.cmd [[:norm gg=G]]
	-- vim.lsp.buf.formatting_sync()
end

vim.cmd [[command! -nargs=0 Format lua require('editor').Format()]]
vim.cmd [[autocmd BufWritePre <buffer> silent! :Format]]

function M.FormatSelection()
	M.Format()
end

vim.api.nvim_set_keymap('', '<C-f>', [[:lua require('editor').FormatSelection()<CR>]], {})

return M
