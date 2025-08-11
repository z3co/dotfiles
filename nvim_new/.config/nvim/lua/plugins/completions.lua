return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, bufopts)
			vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format)
			vim.lsp.enable({ "lua_ls", "ts_ls", "tailwindcss", "gopls" })
		end
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "ts_ls", "tailwindcss", "gopls" },
		},
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = {
						winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder",
						border = "rounded", -- Or 'single', 'double', 'none'
						close_events = { "CursorMoved", "BufHidden", "InsertLeave" },
						-- You might need to adjust positioning based on your setup
						-- row = ...,
						-- col = ...,
					},
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
