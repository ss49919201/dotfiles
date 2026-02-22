return {
	-- Mason: LSPサーバーのインストーラー
	{
		"williamboman/mason.nvim",
		config = function()
			-- Mason を初期化（:Mason コマンドでGUIからサーバー管理できる）
			require("mason").setup()
		end,
	},

	-- Mason と lspconfig の連携
	{
		"williamboman/mason-lspconfig.nvim",
		-- mason.nvim と nvim-lspconfig が先に読み込まれる必要がある
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				-- 起動時に自動でインストールするLSPサーバー
				-- lua_ls: Lua 用、gopls: Go 用、ts_ls: TypeScript/JavaScript 用
				ensure_installed = { "lua_ls", "gopls", "ts_ls" },
				-- インストール後に自動でLSPを設定
				handlers = {
					-- 各サーバーに共通で適用されるデフォルトハンドラー
					function(server_name)
						-- lua_ls の場合は特別な設定を適用
						if server_name == "lua_ls" then
							vim.lsp.config.lua_ls = {
								settings = {
									Lua = {
										runtime = {
											-- Neovim は LuaJIT を使用しているので明示的に指定
											version = "LuaJIT",
										},
										diagnostics = {
											-- `vim` グローバル変数を未定義エラーにしない
											globals = { "vim" },
										},
										workspace = {
											-- Neovim のランタイムファイルをワークスペースに含める（補完強化）
											library = vim.api.nvim_get_runtime_file("", true),
											-- サードパーティライブラリの確認ダイアログを出さない
											checkThirdParty = false,
										},
										telemetry = {
											-- テレメトリー（使用状況の送信）を無効化
											enable = false,
										},
									},
								},
							}
						end
						-- LSPサーバーを有効化
						vim.lsp.enable(server_name)
					end,
				},
			})

			-- キーマップ設定（LSPがアタッチされたときに有効化）
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					-- バッファローカルなキーマップにするためバッファIDを渡す
					local opts = { buffer = args.buf }
					-- gd: カーソル下のシンボルの定義へジャンプ
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					-- gD: カーソル下のシンボルの宣言へジャンプ
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					-- K: カーソル下のシンボルのドキュメントをホバー表示
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					-- gi: カーソル下のシンボルの実装へジャンプ
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					-- gr: カーソル下のシンボルの参照一覧を表示
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					-- <leader>rn: カーソル下のシンボルをリネーム
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					-- <leader>ca: コードアクション（自動修正・リファクタリング候補）を表示
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					-- <leader>e: カーソル行の診断メッセージをフローティングウィンドウで表示
					vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
					-- [d: 前の診断（エラー・警告）へ移動
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
					-- ]d: 次の診断（エラー・警告）へ移動
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				end,
			})
		end,
	},

	-- nvim-lspconfig: 各LSPサーバーのデフォルト設定を提供するプラグイン
	{
		"neovim/nvim-lspconfig",
	},

	-- フォーマッター・リンターの自動インストール
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				-- 起動時に自動でインストールするツール
				ensure_installed = {
					"stylua", -- Lua フォーマッター
					"shfmt", -- Shell スクリプトフォーマッター
					"goimports", -- Go の import 自動整理＆フォーマッター
					"prettierd", -- Web 系（JS/TS/HTML/CSS など）フォーマッター（高速版）
				},
			})
		end,
	},
}
