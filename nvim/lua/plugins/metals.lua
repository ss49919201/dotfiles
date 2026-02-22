return {
  {
    -- nvim-metals: Scala 用 LSP クライアント（Metals）との統合プラグイン
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",      -- 非同期処理などに必要な汎用ライブラリ
      "mfussenegger/nvim-dap",      -- デバッグ機能（DAP）との連携に必要
    },
    -- Scala・sbt・Java ファイルを開いたときだけ読み込む
    ft = { "scala", "sbt", "java" },
    config = function()
      local metals = require("metals")
      -- Metals のデフォルト設定をベースに構成を組み立てる
      local metals_config = metals.bare_config()

      -- Metals の動作設定
      metals_config.settings = {
        showImplicitArguments = true, -- 暗黙の引数をホバー時に表示
        -- 補完・診断の対象から除外するパッケージ（Java API の重複候補を減らす）
        excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
      }

      -- nvim-cmp との連携：LSP の補完能力を cmp に伝える
      metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Metals がバッファにアタッチされたときのキーマップ設定
      metals_config.on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "gd",          vim.lsp.buf.definition,    opts) -- 定義へジャンプ
        vim.keymap.set("n", "gD",          vim.lsp.buf.declaration,   opts) -- 宣言へジャンプ
        vim.keymap.set("n", "K",           vim.lsp.buf.hover,         opts) -- ホバードキュメント表示
        vim.keymap.set("n", "gi",          vim.lsp.buf.implementation, opts) -- 実装へジャンプ
        vim.keymap.set("n", "gr",          vim.lsp.buf.references,    opts) -- 参照一覧を表示
        vim.keymap.set("n", "<leader>rn",  vim.lsp.buf.rename,        opts) -- シンボルをリネーム
        vim.keymap.set("n", "<leader>ca",  vim.lsp.buf.code_action,   opts) -- コードアクションを表示
        vim.keymap.set("n", "<leader>e",   vim.diagnostic.open_float, opts) -- 診断をフローティングで表示
        vim.keymap.set("n", "[d",          vim.diagnostic.goto_prev,  opts) -- 前の診断へ移動
        vim.keymap.set("n", "]d",          vim.diagnostic.goto_next,  opts) -- 次の診断へ移動
        -- Metals 固有
        vim.keymap.set("n", "<leader>ws",  metals.hover_worksheet,    opts) -- Worksheet の評価結果をホバー表示
      end

      -- augroup を作成（重複登録を防ぐために clear = true）
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      -- Scala・sbt・Java ファイルを開いたときに Metals を起動または既存セッションにアタッチ
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt", "java" },
        callback = function()
          metals.initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end,
  },
}
