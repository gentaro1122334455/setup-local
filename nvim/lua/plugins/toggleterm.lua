return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      direction = "vertical",
      size = function()
        return math.floor(vim.o.columns * 0.5)
      end,
      start_in_insert = true,
    })

    -- サイズ強制反映
    vim.keymap.set("n", "<leader>t", function()
      require("toggleterm").toggle(1, math.floor(vim.o.columns * 0.5), vim.fn.getcwd(), "vertical")
    end)

    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
  end,
}
