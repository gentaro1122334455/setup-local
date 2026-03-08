return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      })

      -- space ff
      vim.keymap.set("n", "<leader>ff", function()
        builtin.find_files({
          hidden = true,
          no_ignore = true,
        })
      end, { desc = "Find files including hidden" })
    end,
  },
}
