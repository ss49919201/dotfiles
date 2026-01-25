return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local parsers = { "lua", "go", "gomod", "gosum" }

    -- パーサーのインストール
    require("nvim-treesitter").install(parsers)

    -- ハイライトを有効化（パーサーが利用可能な場合のみ）
    vim.api.nvim_create_autocmd("FileType", {
      pattern = parsers,
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
