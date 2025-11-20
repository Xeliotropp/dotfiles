vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Used to autoclose the brackets
vim.keymap.set('i', '(', '()<Left>')
vim.keymap.set('i', '[', '[]<Left>')
vim.keymap.set('i', '{', '{}<Left>')
vim.keymap.set('i', '"', '""<Left>')
vim.keymap.set('i', "'", "''<Left>")

-- Go to definition
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
-- Show hover documentation
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
-- Rename symbol
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)

require("xelio")
-- require('lspconfig').ts_ls.setup{}
-- Clipboard provider, install one for the system if you have issues pasting
vim.opt.clipboard = "unnamedplus"
vim.g.loaded_perl_provider = 0
vim.opt.wrap = false
vim.diagnostic.config({
  underline = false,
  signs = false,
})

