-- Enable line numbers
vim.opt.number = true

-- For relative line numbers
vim.opt.relativenumber = true

vim.opt.cursorline = true
vim.opt.signcolumn = "auto"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.clipboard = "unnamedplus"
vim.g.netrw_banner = 0

vim.g.loaded_perl_provider = 0
vim.opt.wrap = false
vim.diagnostic.config({
  underline = false,
  signs = true,
})
