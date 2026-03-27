return {
  {
    -- diffview.nvim: Git の差分・履歴をタブUIで閲覧するプラグイン
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("diffview").setup()

      -- キーマップ設定
      vim.keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<cr>",        { desc = "Diffview を開く" })
      vim.keymap.set("n", "<leader>dh", "<cmd>DiffviewFileHistory %<cr>", { desc = "現在ファイルの履歴" })
      vim.keymap.set("n", "<leader>dH", "<cmd>DiffviewFileHistory<cr>", { desc = "リポジトリ全体の履歴" })
      vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<cr>",       { desc = "Diffview を閉じる" })
    end,
  },
}
