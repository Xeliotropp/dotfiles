-- Used to autoclose the brackets
vim.keymap.set("i", "(", "()<Left>")
vim.keymap.set("i", "[", "[]<Left>")
vim.keymap.set("i", "{", "{}<Left>")
vim.keymap.set("i", '"', '""<Left>')
vim.keymap.set("i", "'", "''<Left>")

-- Go to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
-- Show hover documentation
vim.keymap.set("n", "K", vim.lsp.buf.hover)
-- Rename symbol
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

-- Keymaps for navigating buffers like tabs
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { silent = true })
vim.keymap.set("n", "<leader>bo", ":BufferLineCloseOthers<CR>", { silent = true })

-- Optional: Move buffers
vim.keymap.set("n", "<leader>bl", ":BufferLineMoveNext<CR>", { silent = true })
vim.keymap.set("n", "<leader>bh", ":BufferLineMovePrev<CR>", { silent = true })

vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<leader>vv", ":vsplit<CR>", { silent = true })
vim.keymap.set("n", "<leader>hh", ":split<CR>", { silent = true })
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})
