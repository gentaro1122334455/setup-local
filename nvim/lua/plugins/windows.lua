return {
  "anuvyklack/windows.nvim",
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim",
  },
  event = "WinNew",
  keys = {
    { "<leader>z", "<cmd>WindowsMaximize<cr>", desc = "Maximize window" },
    { "<leader>=", "<cmd>WindowsEqualize<cr>", desc = "Equalize windows" },
    { "<leader>Z", "<cmd>WindowsToggleAutowidth<cr>", desc = "Toggle autowidth" },
  },
  config = function()
    vim.o.winwidth = 10
    vim.o.winminwidth = 10
    vim.o.equalalways = false
    require("windows").setup()
  end,
}
