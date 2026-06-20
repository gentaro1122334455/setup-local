-- Markdown 編集時のバッファローカル設定（見やすさ向上）
-- このファイルは markdown を開くたびに自動で適用されます。
vim.opt_local.wrap = true -- 長い行を画面内で折り返す
vim.opt_local.linebreak = true -- 単語/文の途中ではなく境界で折り返す
vim.opt_local.breakindent = true -- 折り返した行のインデントを揃える
vim.opt_local.conceallevel = 2 -- **太字** や [link] 等の装飾記号を隠して見やすく（render-markdown 用）
vim.opt_local.spell = false -- 日本語混在では誤検知が多いので既定はオフ（英文校正したい時は true）
