return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
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
			vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help)
			vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)
			vim.lsp.enable({ "lua_ls", "ts_ls", "tailwindcss", "gopls", "html", "tinymist" })
			-- Solve warnings in neovim config
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "ts_ls", "tailwindcss", "gopls", "tinymist" },
		},
	},
	"hrsh7th/cmp-nvim-lsp",
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
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
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.stylua,
					require("none-ls.diagnostics.eslint_d"),
					null_ls.builtins.formatting.gofumpt,
					null_ls.builtins.diagnostics.golangci_lint,
				},
			})
		end,
	},
}
