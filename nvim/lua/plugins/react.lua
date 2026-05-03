return {
  -- LSP for React/TS
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ts_ls = {}, -- TypeScript/React LSP
        eslint = {},
        emmet_ls = {},
      },
    },
  },

  -- Treesitter強化
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "typescript",
        "tsx",
        "javascript",
        "html",
        "css",
        "json",
      })
    end,
  },

  -- Emmet（JSX爆速化）
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_ls = {
          filetypes = {
            "html",
            "css",
            "javascriptreact",
            "typescriptreact",
          },
        },
      },
    },
  },
}
