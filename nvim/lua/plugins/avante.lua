return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,

    build = "make",

    opts = {
      provider = "openai",
      -- 修正箇所: vendors テーブルの中に設定を移動
      vendors = {
        openai = {
          model = "gpt-4o-mini",
        },
      },
      throttling = true,
      disable_auto_token_count = true,
    },

    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim", -- タイポ(nui.nvim)も修正しておきました
      "stevearc/dressing.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
