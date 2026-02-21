return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          separator_style = "slant",
          show_buffer_close_icons = true,
          show_close_icon = false,
          diagnostics = "nvim_lsp",
        },
      })

      -- タブ操作のキーマップ
      vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "次のバッファ" })
      vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "前のバッファ" })
      vim.keymap.set("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "バッファを閉じる" })
    end,
  },
}
