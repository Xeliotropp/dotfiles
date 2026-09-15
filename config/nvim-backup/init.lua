-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.termguicolors = true

-- Set keybindings and options
require("config.options")
require("config.keybindings")
require("config.packages")
