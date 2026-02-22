return {
  -- conform.nvim: フォーマッターを統一的に管理するプラグイン
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- ファイル保存直前に読み込む
  cmd = { "ConformInfo" },   -- :ConformInfo コマンドで現在のフォーマッター情報を確認できる
  keys = {
    {
      "<leader>f",
      function()
        -- 非同期でフォーマットを実行（UI をブロックしない）
        require("conform").format({ async = true })
      end,
      mode = "",           -- ノーマル・ビジュアル両モードで有効
      desc = "Format buffer",
    },
  },
  opts = {
    -- ファイルタイプごとに使用するフォーマッターを指定
    formatters_by_ft = {
      lua            = { "stylua" },    -- Lua フォーマッター
      sh             = { "shfmt" },     -- Shell スクリプトフォーマッター
      go             = { "goimports", "gofmt" }, -- goimports で import 整理後 gofmt でフォーマット
      typescript     = { "prettierd" }, -- TypeScript フォーマッター（高速版 prettier）
      typescriptreact = { "prettierd" }, -- TSX フォーマッター
      javascript     = { "prettierd" }, -- JavaScript フォーマッター
      javascriptreact = { "prettierd" }, -- JSX フォーマッター
    },
    -- 保存時に自動フォーマット
    format_on_save = {
      timeout_ms = 500,        -- タイムアウト 500ms（超えたらフォーマットをスキップ）
      lsp_format = "fallback", -- conform のフォーマッターがない場合は LSP のフォーマットを使用
    },
  },
}
