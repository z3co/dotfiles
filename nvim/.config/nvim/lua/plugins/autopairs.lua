-- Example of adding nvim-autopairs (if not already present)
return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end
  },
}
