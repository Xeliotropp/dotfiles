vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
})

require("nvim-treesitter").install({
    "html",
    "css",
    "typescript",
    "javascript",
    "tsx",
    "lua",
    "vim",
    "vimdoc",
    "c",
    "cpp",
    "bash",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "html", "css", "typescript", "javascript",
        "typescriptreact", "javascriptreact",
        "lua", "vim", "help",
        "c", "cpp", "sh",
    },
    callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
