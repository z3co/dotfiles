return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim" },
  config = function()
    vim.keymap.set('n', '<leader>e', ':Neotree filesystem focus<CR>', {})
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle<CR>', {})
    require("neo-tree").setup({
      enable_diagnostics = false,
      window = {
        width = 30,
      },
      git_status = {
        git_status = {
            symbols = {
              -- Change type
              added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
              modified = " ", -- or "", but this is redundant info if you use git_status_colors on the name
              deleted = "✖", -- this can only be used in the git_status source
              renamed = "󰁕", -- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored = "",
              unstaged = "󰄱",
              staged = "",
              conflict = "",
            },
          },
      },
      filesystem = {
        filtered_items = {
          hide_gitignored = false,
          hide_by_name = {
            "node_modules",
            "next-env.d.ts",
            "tsconfig.tsbuildinfo",
          }
        }
      }
    })
  end
}
