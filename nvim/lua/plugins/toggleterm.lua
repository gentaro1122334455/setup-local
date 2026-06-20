return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      direction = "horizontal",
      size = function()
        return math.floor(vim.o.lines * 0.3)
      end,
      start_in_insert = true,
    })

    vim.keymap.set("n", "<leader>t", function()
      require("toggleterm").toggle(1, math.floor(vim.o.lines * 0.3), vim.fn.getcwd(), "horizontal")
    end)

    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
  end,
}
