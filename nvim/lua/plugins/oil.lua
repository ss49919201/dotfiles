return {
  {
    -- oil.nvim: バッファのようにファイルシステムを編集できるファイラー
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- ファイルアイコン表示に必要
    config = function()
      require("oil").setup({
        default_file_explorer = true, -- Neovim デフォルトのファイラー（netrw）を oil.nvim に置き換える
        view_options = {
          show_hidden = true, -- ドットファイル（隠しファイル）も表示する
        },
      })

      -- -: カレントファイルの親ディレクトリを oil.nvim で開く
      vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "親ディレクトリを開く" })
    end,
  },
}
