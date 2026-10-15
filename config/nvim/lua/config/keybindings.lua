-- Go to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
-- Show hover documentation
vim.keymap.set("n", "K", vim.lsp.buf.hover)
-- Rename symbol
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

-- Keymaps for navigating buffers like tabs
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", ":bdelete<CR>", { silent = true })
vim.keymap.set("n", "<leader>w", ":wa<CR>", {})
vim.keymap.set("n", "<leader>wq", ":wqa!<CR>", {})
vim.keymap.set("n", "<leader>aq", ":qa!<CR>", {})

-- Optional: Move buffers
vim.keymap.set("n", "<leader>bl", ":BufferLineMoveNext<CR>", { silent = true })
vim.keymap.set("n", "<leader>bh", ":BufferLineMovePrev<CR>", { silent = true })

--vim.keymap.set("n", "<C-f>", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<C-f>", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<leader>vv", ":vsplit<CR>", { silent = true })
vim.keymap.set("n", "<leader>hh", ":split<CR>", { silent = true })
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})
vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>cp", ":lua vim.diagnostic.open_float()<CR>", {silent=true})

local function telescope(fn, opts)
  return function()
    require("telescope.builtin")[fn](opts)
  end
end

vim.keymap.set("n", "<leader>pf", telescope("find_files"), { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>gf", telescope("git_files"), { desc = "Git find files" })
vim.keymap.set("n", "<leader>fg", telescope("live_grep"), { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>pb", telescope("buffers"), { desc = "Telescope buffers" })

vim.keymap.set("n", "<leader>ps", function()
  require("telescope.builtin").grep_string({ search = vim.fn.input("Search: > ") })
end, { desc = "Grep string" })

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
