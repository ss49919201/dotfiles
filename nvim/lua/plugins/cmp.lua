return {
  -- nvim-cmp: 補完エンジン本体
  "hrsh7th/nvim-cmp",
  -- 挿入モードに入ったときだけ読み込む（起動高速化）
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- LSP からの補完候補を提供
    "hrsh7th/cmp-buffer",   -- 開いているバッファの単語を補完候補に追加
    "hrsh7th/cmp-path",     -- ファイルパスを補完候補に追加
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      -- キーマップ設定
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),    -- 次の候補を選択
        ["<C-p>"] = cmp.mapping.select_prev_item(),    -- 前の候補を選択
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),       -- ドキュメントを上にスクロール
        ["<C-f>"] = cmp.mapping.scroll_docs(4),        -- ドキュメントを下にスクロール
        ["<C-Space>"] = cmp.mapping.complete(),        -- 補完メニューを手動で開く
        ["<C-e>"] = cmp.mapping.abort(),               -- 補完を中断してメニューを閉じる
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- 選択中の候補を確定（未選択なら先頭を確定）
        ["<Tab>"] = cmp.mapping.select_next_item(),    -- Tab で次の候補へ
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),  -- Shift+Tab で前の候補へ
      }),
      -- 補完候補のソース（上から優先順に適用）
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP からの候補（最優先）
        { name = "buffer" },   -- バッファ内の単語
        { name = "path" },     -- ファイルパス
      }),
    })
  end,
}
