-- Markdown を見やすく表示 ＆ ブラウザでプレビュー
--
-- 反映方法: nvim を再起動すると lazy.nvim が自動でインストールします（`:Lazy sync` でも可）。
-- プレビュー(2)は初回に node でサーバをビルドします（`node` が必要）。
--
-- 主なキーマップ（markdown バッファでのみ有効）:
--   <leader>mp … ブラウザプレビューの ON/OFF
--   <leader>um … エディタ内の装飾表示の ON/OFF
return {
  -- 1) エディタ内レンダリング: 見出し・コードブロック・表・箇条書き・チェックボックス等を装飾表示
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "markdown.mdx" },
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- アイコンは mini.icons / nvim-web-devicons を自動検出
    opts = {
      code = { width = "block", right_pad = 1 }, -- コードブロックを枠状に見やすく
      heading = { sign = false }, -- 見出しのサイン列は使わない
    },
    keys = {
      { "<leader>um", "<cmd>RenderMarkdown toggle<cr>", desc = "Markdown 装飾表示の切替", ft = "markdown" },
    },
  },

  -- 2) ブラウザでライブプレビュー（編集に追従。:MarkdownPreviewToggle）
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    ft = { "markdown" },
    build = function()
      -- lazy のビルド時点ではプラグイン未ロードで mkdp#util#install が未定義になる(E117)ため、
      -- 先にプラグインをロードしてからインストール関数を呼ぶ。
      vim.cmd([[Lazy load markdown-preview.nvim]])
      vim.fn["mkdp#util#install"]() -- プレビュー用サーバを取得（node が必要）
    end,
    init = function()
      vim.g.mkdp_auto_close = 0 -- バッファを離れても自動で閉じない
      vim.g.mkdp_theme = "dark" -- "light" も可
    end,
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown プレビュー(ブラウザ)", ft = "markdown" },
    },
  },

  -- 3) treesitter パーサ（ハイライト/レンダリングに必須。既存の ensure_installed に追記）
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
    end,
  },
}
