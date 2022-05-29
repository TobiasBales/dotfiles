vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('packages')
require('gitsigns-config')
require('keybindings')
require('lazygit-config')
require("linters")
require('lsp-config')
require('lualine-config')
require('settings')
require('telescope-config')
require('treesitter-config')
require('gps-config') -- gps depends on treesitter so we run it after treesitter is initalized
require('trouble-config')
