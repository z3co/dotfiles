return {
	{
		"echasnovski/mini.pick",
		config = function()
			require("mini.pick").setup()
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "<leader>ff", ":Pick files<CR>", bufopts)
			vim.keymap.set("n", "<leader>fh", ":Pick help<CR>", bufopts)
		end,
	},
	{
		"stevearc/oil.nvim",
		config = function()
			local oil = require("oil")
			oil.setup()
			vim.keymap.set("n", "<leader>e", oil.toggle_float)
		end,
	}
}
