return {
	"sylvanfranklin/omni-preview.nvim",
	dependencies = {
		-- Typst
		{ "chomosuke/typst-preview.nvim", lazy = true },
	},
	opts = {},
	keys = {
		{ "<leader>po", "<cmd>OmniPreview start<CR>", desc = "OmniPreview Start" },
		{ "<leader>pc", "<cmd>OmniPreview stop<CR>", desc = "OmniPreview Stop" },
	},
}
