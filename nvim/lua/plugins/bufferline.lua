return {
  {
    -- bufferline.nvim: 開いているバッファをタブのように上部に表示するプラグイン
    "akinsho/bufferline.nvim",
    version = "*", -- 最新バージョンを使用
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- ファイルアイコン表示に必要
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",              -- タブではなくバッファ単位で表示
          separator_style = "slant",     -- バッファ間の区切りを斜め（スラント）スタイルに
          show_buffer_close_icons = true, -- 各バッファに閉じるボタン（×）を表示
          show_close_icon = false,       -- バーライン全体の閉じるボタンは非表示
          diagnostics = "nvim_lsp",      -- LSP の診断結果（エラー数など）をタブに表示
        },
      })

      -- タブ操作のキーマップ
      vim.keymap.set("n", "<Tab>",   "<cmd>BufferLineCycleNext<cr>", { desc = "次のバッファ" })
      vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "前のバッファ" })
      vim.keymap.set("n", "<leader>x", "<cmd>bdelete<cr>",           { desc = "バッファを閉じる" })
    end,
  },
}
