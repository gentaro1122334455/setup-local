-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- lazy.nvim の `keys` より後に登録する（init.lua だと上書きされる）
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { silent = true, desc = "Prev buffer" })

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
local telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader>fg", function()
  telescope.live_grep({
    additional_args = function()
      return { "--hidden" }
    end,
  })
end, { desc = "Search text (including hidden files)" })
