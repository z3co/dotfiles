vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.wo.relativenumber = true
vim.g.mapleader = " "
-- Configure how diagnostics are displayed
vim.diagnostic.config({
  virtual_text = true,      -- Show diagnostic messages as virtual text
  signs = true,             -- Show signs in the sign column
  underline = true,         -- Underline the code with the diagnostic
  update_in_insert = false, -- Don't update diagnostics in insert mode
  severity_sort = true,     -- Sort diagnostics by severity
  -- You can customize the virtual text format if needed
  -- virtual_text = {
  --   prefix = "●", -- Customize the prefix for virtual text
  --   format = function(diagnostic)
  --     return diagnostic.message
  --   end,
  -- },
})
