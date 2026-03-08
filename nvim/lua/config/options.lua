-- Enable line numbers
vim.opt.number = true -- Show line numbers
vim.opt.updatetime = 300

-- For relative line numbers
vim.opt.relativenumber = true -- Show relative line numbers

vim.opt.cursorline = true 
vim.opt.signcolumn = "auto"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.clipboard = "unnamedplus"

vim.g.loaded_perl_provider = 0
vim.g.transparent_enable = true
vim.opt.wrap = false
vim.diagnostic.config({
	underline = false,
	signs = true,
})
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false })
    end,
})
