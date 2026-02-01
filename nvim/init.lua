require("config.lazy")

-- 行番号を表示
vim.opt.number = true

-- カーソル移動で行末から次の行、行頭から前の行へ移動できるようにする
-- h: h キーで前の行へ
-- l: l キーで次の行へ
vim.opt.whichwrap = "h,l"

-- クリップボード連携
-- ヤンク（コピー）した内容をシステムのクリップボードにも送る
vim.opt.clipboard = "unnamedplus"

-- ========================================
-- 背景を透過させる設定
-- ========================================

-- カラースキームが変更されたときに自動的に透過設定を適用
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*", -- すべてのカラースキームに適用
	callback = function()
		-- 通常のテキスト領域の背景を透過
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- フローティングウィンドウ（補完メニューなど）の背景を透過
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		-- 非アクティブなウィンドウの背景を透過
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		-- サイン列（エラーマークなどが表示される左端の列）の背景を透過
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		-- 行番号の背景を透過
		vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
	end,
})

-- 起動時にも透過設定を適用（カラースキーム設定前でも有効化）
vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- 通常のテキスト領域
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- フローティングウィンドウ
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" }) -- 非アクティブウィンドウ
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" }) -- サイン列
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" }) -- 行番号

-- ========================================
-- インデント設定（デフォルト）
-- ========================================
vim.opt.expandtab = true -- タブをスペースに変換
vim.opt.tabstop = 4 -- タブ幅
vim.opt.shiftwidth = 4 -- 自動インデント幅
vim.opt.softtabstop = 4 -- <Tab>キーで挿入されるスペース数

-- ========================================
-- ファイルタイプ別インデント設定
-- ========================================
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "javascript", "typescript", "typescriptreact", "javascriptreact", "json", "html", "css", "yaml" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true -- スペースを使用
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "go", "make" },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.expandtab = false -- タブ文字を使用
	end,
})
