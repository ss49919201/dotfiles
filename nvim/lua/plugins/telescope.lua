return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- パフォーマンス向上のためのネイティブソーター
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          -- 検索結果のレイアウト
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              preview_width = 0.5,
            },
          },
          -- 無視するファイル・ディレクトリ
          file_ignore_patterns = {
            "node_modules",
            ".git/",
            "%.lock",
          },
        },
        pickers = {
          find_files = {
            hidden = true, -- 隠しファイルも検索
          },
          live_grep = {
            additional_args = function()
              return { "--hidden" } -- 隠しファイルも検索
            end,
          },
        },
      })

      -- fzf-native 拡張を読み込み（パフォーマンス向上）
      pcall(telescope.load_extension, "fzf")

      -- キーマップ設定
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "ファイル検索" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "全文検索 (grep)" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "バッファ検索" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "ヘルプ検索" })
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "最近開いたファイル" })
      vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "カーソル下の単語を検索" })
    end,
  },
}
