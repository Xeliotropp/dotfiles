-- Enable line numbers
vim.opt.number = true  -- Show line numbers

-- For relative line numbers
vim.opt.relativenumber = true  -- Show relative line numbers

-- Other helpful settings you might want
vim.opt.cursorline = true  -- Highlight the current line
vim.opt.signcolumn = "auto"  -- Always show the signcolumn (for git signs, diagnostics, etc.)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.clipboard = "unnamedplus"

vim.g.loaded_perl_provider = 0
vim.opt.wrap = false
vim.diagnostic.config({
  underline = false,
  signs = false,
})
