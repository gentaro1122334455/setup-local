return {
  ---------------------------------------------------
  -- Copilot本体
  ---------------------------------------------------
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<Tab>",
            next = "<C-]>",
            prev = "<C-[>",
            dismiss = "<C-e>",
          },
        },
        panel = { enabled = false },
      })
    end,
  },

  ---------------------------------------------------
  -- nvim-cmp 連携
  ---------------------------------------------------
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      local ok, cmp = pcall(require, "cmp")
      if not ok then
        return
      end
      require("copilot_cmp").setup()
    end,
  },

  ---------------------------------------------------
  -- Copilot Chat
  ---------------------------------------------------
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "nvim-lua/plenary.nvim",
    },
    build = "make tiktoken",
    opts = {
      debug = false,
      window = {
        layout = "float",
      },
    },
    keys = {
      { "<leader>cc", "<cmd>CopilotChat<cr>", desc = "CopilotChat 開く" },
      { "<leader>ce", "<cmd>CopilotChatExplain<cr>", mode = "v", desc = "Explain" },
      { "<leader>cf", "<cmd>CopilotChatFix<cr>", mode = "v", desc = "Fix" },
      { "<leader>cr", "<cmd>CopilotChatRefactor<cr>", mode = "v", desc = "Refactor" },
    },
  },
}
