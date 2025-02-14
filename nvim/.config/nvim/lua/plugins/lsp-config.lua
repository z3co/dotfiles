return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.eslint.setup({
        capabilities = capabilities,
        root_dir = function(fname)
          return lspconfig.util.root_pattern("eslint.json", ".git")(fname)
              or lspconfig.util.path.dirname(fname)
        end,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.ruby_lsp.setup({
        capabilities = capabilities,
      })
      lspconfig.biome.setup({
        capabilities = capabilities,
        root_dir = function(fname)
          return lspconfig.util.root_pattern("biome.json", ".git")(fname)
              or lspconfig.util.path.dirname(fname)
        end,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
        root_dir = function(fname)
          return lspconfig.util.root_pattern("html.json", ".git")(fname) or lspconfig.util.path.dirname(fname)
        end,
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
      vim.keymap.set({ "n" }, "gK", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
    end,
  },
}
