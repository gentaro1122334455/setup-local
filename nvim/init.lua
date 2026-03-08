vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.guicursor = "i:ver25"

require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = false
vim.o.background = "dark"
vim.cmd("colorscheme habamax")

vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "#000000" })
