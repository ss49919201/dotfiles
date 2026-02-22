return {
  -- nvim-treesitter: シンタックスハイライトや構文解析を高精度で行うプラグイン
  "nvim-treesitter/nvim-treesitter",
  -- プラグイン更新時にパーサーも自動更新する
  build = ":TSUpdate",
  config = function()
    -- ハイライトを有効化するファイルタイプ（パーサー）の一覧
    local parsers = { "lua", "go", "gomod", "gosum", "typescript", "tsx", "javascript", "scala", "sbt" }

    -- パーサーのインストール
    require("nvim-treesitter").install(parsers)

    -- ハイライトを有効化（パーサーが利用可能な場合のみ）
    -- pcall でエラーを無視しつつ、対象ファイルタイプを開いたときに Treesitter を起動
    vim.api.nvim_create_autocmd("FileType", {
      pattern = parsers,
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
