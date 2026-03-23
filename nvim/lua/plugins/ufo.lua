return {
  {
    -- nvim-ufo: LSP/treesitter ベースのコード折り畳み
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      -- fold の表示設定
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99  -- 起動時はすべて展開
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      require("ufo").setup({
        provider_selector = function()
          return { "treesitter", "indent" } -- treesitter → indent の順でフォールバック
        end,
      })

      -- キーマップ
      vim.keymap.set("n", "zR", require("ufo").openAllFolds,  { desc = "すべて展開" })
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "すべて折り畳む" })
      vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "1段階展開" })
      vim.keymap.set("n", "zm", require("ufo").closeFoldsWith,       { desc = "1段階折り畳む" })
    end,
  },
}
