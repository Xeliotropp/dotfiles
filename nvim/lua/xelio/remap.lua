vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Compatibility layer for older Neovim versions
if not vim.keymap then
    vim.keymap = {}
    vim.keymap.set = function(mode, lhs, rhs, opts)
        opts = opts or {}
        opts.noremap = opts.noremap ~= false
        vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
    end
end

vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<C-h>", ":NvimTreeFocus<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { silent = true })
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>', { silent = true })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { silent = true })
