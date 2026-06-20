return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- 遅延ロードで軽量化
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },

      current_line_blame = true,

      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 行末に表示（GitLensっぽい）
        delay = 500,
      },

      -- キーマップ（便利）
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local map = function(mode, l, r)
          vim.keymap.set(mode, l, r, { buffer = bufnr })
        end

        -- hunk移動
        map("n", "]c", gs.next_hunk)
        map("n", "[c", gs.prev_hunk)

        -- hunk操作
        map("n", "<leader>hs", gs.stage_hunk)
        map("n", "<leader>hr", gs.reset_hunk)

        -- blame表示トグル
        map("n", "<leader>gb", gs.toggle_current_line_blame)
      end,
    })
  end,
}
