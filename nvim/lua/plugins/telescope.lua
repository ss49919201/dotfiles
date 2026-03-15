return {
  {
    -- telescope.nvim: ファジーファインダー（ファイル・文字列・バッファなどを検索するUI）
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.1", -- 使用するバージョンを固定
    dependencies = {
      "nvim-lua/plenary.nvim", -- Telescope が依存する汎用 Lua ライブラリ
      -- パフォーマンス向上のためのネイティブソーター
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make", -- インストール時に C コードをビルド
      },
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          -- 検索結果のレイアウト
          layout_strategy = "horizontal", -- 左にリスト、右にプレビューの横並びレイアウト
          layout_config = {
            horizontal = {
              preview_width = 0.5, -- プレビュー欄をウィンドウ幅の 50% に設定
            },
          },
          -- 無視するファイル・ディレクトリ（検索対象から除外）
          file_ignore_patterns = {
            "node_modules", -- Node.js の依存ライブラリ
            ".git/",        -- Git の内部ディレクトリ
            "%.lock",       -- ロックファイル（package-lock.json など）
          },
        },
        pickers = {
          find_files = {
            hidden = true, -- 隠しファイル（ドットファイル）も検索対象に含める
          },
          live_grep = {
            additional_args = function()
              return { "--hidden" } -- 隠しファイルも grep 対象に含める
            end,
          },
        },
      })

      -- fzf-native 拡張を読み込み（パフォーマンス向上）
      -- pcall でロード失敗時もエラーを無視して続行
      pcall(telescope.load_extension, "fzf")

      -- キーマップ設定
      vim.keymap.set("n", "<leader>ff", builtin.find_files,   { desc = "ファイル検索" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep,    { desc = "全文検索 (grep)" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers,      { desc = "バッファ検索" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags,    { desc = "ヘルプ検索" })
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles,     { desc = "最近開いたファイル" })
      vim.keymap.set("n", "<leader>fw", builtin.grep_string,  { desc = "カーソル下の単語を検索" })
    end,
  },
}
