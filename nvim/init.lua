vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.guicursor = "i:ver25"

require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = false
vim.cmd("colorscheme tokyonight")
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
