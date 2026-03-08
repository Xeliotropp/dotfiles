vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = 'blade',
    ['.*.conf'] = 'bash'
  },
})
require("config.options")
require("config.lazy")
require("config.keybindings")
