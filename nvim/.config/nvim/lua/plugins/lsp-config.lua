return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls" },
      })
    end,
  },
  {
    -- use official lspconfig package (and enable completion):
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    lazy = false,
    config = function()
      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lsp_on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "go", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set({ "n" }, "gK", vim.lsp.buf.code_action, {})
      end
      local lspconfig = require("lspconfig")
      for _, server in pairs({ "tailwindcss", "ts_ls", "lua_ls", "gopls" }) do
        lspconfig[server].setup({
          capabilities = lsp_capabilities,
          on_attach = lsp_on_attach,
        })
      end
    end,
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
}
