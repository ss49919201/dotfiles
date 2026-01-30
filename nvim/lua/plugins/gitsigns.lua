return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns
			local opts = { buffer = bufnr }

			-- ナビゲーション
			vim.keymap.set("n", "]c", function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return "<Ignore>"
			end, { buffer = bufnr, expr = true })

			vim.keymap.set("n", "[c", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return "<Ignore>"
			end, { buffer = bufnr, expr = true })

			-- アクション
			vim.keymap.set("n", "<leader>hp", gs.preview_hunk, opts)
			vim.keymap.set("n", "<leader>hr", gs.reset_hunk, opts)
			vim.keymap.set("n", "<leader>hb", gs.blame_line, opts)
		end,
	},
}
