return {
  {
    "echasnovski/mini.pick",
    config = function()
      require("mini.pick").setup()
      vim.keymap.set("n", "<leader>ff", ":Pick files<CR>")
      vim.keymap.set("n", "<leader>fh", ":Pick help<CR>")
    end,
  },
}
