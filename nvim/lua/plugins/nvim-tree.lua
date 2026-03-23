return {
  {
    -- nvim-tree.lua: サイドバー型ツリーファイラー
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        filters = {
          dotfiles = false, -- ドットファイルも表示する
        },
        renderer = {
          highlight_opened_files = "name", -- 開いているファイルをハイライト
        },
        update_focused_file = {
          enable = true, -- 開いているファイルをツリーで自動フォーカス
        },
      })

      -- -: nvim-tree をトグル
      vim.keymap.set("n", "-", "<cmd>NvimTreeToggle<cr>", { desc = "ファイルツリーをトグル" })
    end,
  },
}
