require("xelio.remap")
require("xelio.packer")
require("xelio.catppuccin")
require("xelio.options")
require("nvim-tree").setup()

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})


require("xelio.completion")
require("conform").setup({
    formatters_by_ft = {
        blade = { "blade_formatter" },
    },
})

vim.opt.termguicolors = true
require("bufferline").setup{}
