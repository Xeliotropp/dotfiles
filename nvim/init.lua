vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  },
})
require("config.options")
require("config.lazy")
require("config.keybindings")
