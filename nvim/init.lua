vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.guicursor = "i:ver25"
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = { "utf-8", "cp932", "shift_jis", "latin1" }

require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = false
vim.cmd("colorscheme tokyonight")
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fy", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("Copied: " .. path)
end, { desc = "Copy current file path" })
vim.o.autoread = true

vim.api.nvim_create_autocmd({
  "FocusGained",
  "BufEnter",
  "CursorHold",
  "CursorHoldI",
}, {
  command = "checktime",
})
