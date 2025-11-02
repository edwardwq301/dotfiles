return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    lazygit = {enabled=false},
    git = {enabled=true},
    dashboard = { enabled = false },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = {
      enabled = true,
      hidden = true,
      exclude = { "node_modules", ".git" },
      layout = {
        preset = "default",
        preview = false,
      },
      sources = {
        grep = {
          layout = {
            preview = true,
          }
        },
        explorer = {
          hidden = true,
          ignored = true,
          win = {
            list = {
              wo = {
                number = true,
                relativenumber = true,
              },
            },
          },
        },
      },
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
