vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = 'blade',
    ['.*.conf'] = 'bash'
  },
})
vim.opt.termguicolors = true
require("config.options")
require("config.lazy")
require("config.keybindings")
