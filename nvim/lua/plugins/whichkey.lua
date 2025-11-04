return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = { preset = "modern" },
  config = function()
    local wk = require("which-key")

    wk.add({
      -- Group definitions
      { "<leader>d",       group = "Debugger" },
      { "<leader>f",       group = "Find" },
      { "<leader>F",       group = "File" },
      { "<leader>g",       group = "Git" },
      { "<leader>l",       group = "LSP" },
      { "<leader>s",       group = "Search" },
      { "<leader>w",       group = "Window" },

      -- General
      { "<leader>Fw",      "<cmd>w<CR>",                                                                     group = "File",       desc = "Save Current  File",               nowait = true,       remap = false },

      -- Top Pickers & Explorer
      { "<leader><space>", function() require("snacks").picker.smart({ filter = { cwd = true } }) end,       group = "Find",       desc = "Smart Find Files" },
      { "<leader>/",       function() require("snacks").picker.grep({ hidden = true }) end,                  group = "Search",     desc = "Grep" },
      { "<leader>e",       function() require("snacks").explorer() end,                                      group = "File",       desc = "File Explorer" },

      -- Find
      { "<leader>fb",      function() require("snacks").picker.buffers() end,                                group = "Find",       desc = "Buffers" },
      { "<leader>ff",      function() require("snacks").picker.files({ hidden = true, ignored = true }) end, group = "Find",       desc = "Find Files" },

      -- Git
      { "<leader>gb",      function() require("snacks").picker.git_branches() end,                           group = "Git",        desc = "Git Branches" },
      { "<leader>gl",      function() require("snacks").picker.git_log() end,                                group = "Git",        desc = "Git Log" },
      { "<leader>gL",      function() require("snacks").picker.git_log_line() end,                           group = "Git",        desc = "Git Log Line" },
      { "<leader>gs",      function() require("snacks").picker.git_status() end,                             group = "Git",        desc = "Git Status" },
      { "<leader>gS",      function() require("snacks").picker.git_stash() end,                              group = "Git",        desc = "Git Stash" },
      { "<leader>gd",      function() require("snacks").picker.git_diff() end,                               group = "Git",        desc = "Git Diff (Hunks)" },
      { "<leader>gf",      function() require("snacks").picker.git_log_file() end,                           group = "Git",        desc = "Git Log File" },
      { "<leader>gB",      function() require("snacks").gitbrowse() end,                                     group = "Git",        desc = "Git Browse",                       mode = { "n", "v" } },
      { "<leader>gg",      function() require("snacks").lazygit() end,                                       group = "Git",        desc = "Lazygit" },

      -- Search
      { "<leader>sb",      function() require("snacks").picker.lines() end,                                  group = "Search",     desc = "Buffer Lines" },
      { "<leader>sd",      function() require("snacks").picker.diagnostics() end,                            group = "Search",     desc = "Diagnostics" },
      { "<leader>sD",      function() require("snacks").picker.diagnostics_buffer() end,                     group = "Search",     desc = "Buffer Diagnostics" },

      -- LSP Navigation
      { "gd",              function() require("snacks").picker.lsp_definitions() end,                        group = "LSP",        desc = "Go to Definition" },
      { "gD",              function() require("snacks").picker.lsp_declarations() end,                       group = "LSP",        desc = "Go to Declaration" },
      { "gr",              function() require("snacks").picker.lsp_references() end,                         group = "LSP",        desc = "References",                       nowait = true },
      { "gI",              function() require("snacks").picker.lsp_implementations() end,                    group = "LSP",        desc = "Go to Implementation" },
      { "gy",              function() require("snacks").picker.lsp_type_definitions() end,                   group = "LSP",        desc = "Go to Type Definition" },

      -- Window Management
      { "<leader>w\\",     "<cmd>vsp<CR>",                                                                   group = "Window",     desc = "Vertical split" },
      { "<leader>w-",      "<cmd>sp<CR>",                                                                    group = "Window",     desc = "Horizontal split" },
      { "<leader>wh",      "<C-w>h",                                                                         group = "Window",     desc = "Go to left window" },
      { "<leader>wj",      "<C-w>j",                                                                         group = "Window",     desc = "Go to lower window" },
      { "<leader>wk",      "<C-w>k",                                                                         group = "Window",     desc = "Go to upper window" },
      { "<leader>wl",      "<C-w>l",                                                                         group = "Window",     desc = "Go to right window" },
      { "<leader>wq",      "<C-w>c",                                                                         group = "Window",     desc = "Close window" },
      { "<leader>wo",      "<C-w>o",                                                                         group = "Window",     desc = "Close other windows" },
      { "<leader>w=",      "<C-w>=",                                                                         group = "Window",     desc = "Balance windows" },

      -- Navigation
      { "j",               "v:count == 0 ? 'gj' : 'j'",                                                      group = "Navigation", desc = "Move down (line-wrap aware)",      expr = true,         mode = { "n", "v" } },
      { "k",               "v:count == 0 ? 'gk' : 'k'",                                                      group = "Navigation", desc = "Move up (line-wrap aware)",        expr = true,         mode = { "n", "v" } },
      { "L",               "g_",                                                                             group = "Navigation", desc = "Go to line end",                   mode = { "n", "v" } },
      { "H",               "^",                                                                              group = "Navigation", desc = "Go to line start",                 mode = { "n", "v" } },

      -- Scrolling
      { "<C-d>",           "<C-d>zz",                                                                        group = "Scrolling",  desc = "Scroll down with cursor centering" },
      { "<C-u>",           "<C-u>zz",                                                                        group = "Scrolling",  desc = "Scroll up with cursor centering" },

      -- Editing
      { "<C-BS>",          "<C-w>",                                                                          group = "Editing",    desc = "Delete previous word",             mode = "i" },
      { ">",               ">gv",                                                                            group = "Editing",    desc = "Indent and keep selection",        mode = "v" },
      { "<",               "<gv",                                                                            group = "Editing",    desc = "Unindent and keep selection",      mode = "v" },
      { "J",               ":move '>+1<CR>gv-gv",                                                            group = "Editing",    desc = "Move selection down",              mode = "x" },
      { "K",               ":move '<-2<CR>gv-gv",                                                            group = "Editing",    desc = "Move selection up",                mode = "x" },
      { "<C-/>",           "gc",                                                                             group = "Editing",    desc = "Toggle comment",                   mode = { "n", "v" }, remap = true },

      -- Window navigation
      { "<C-h>",           "<C-w>h",                                                                         group = "Window",     desc = "Go to left window" },
      { "<C-j>",           "<C-w>j",                                                                         group = "Window",     desc = "Go to lower window" },
      { "<C-k>",           "<C-w>k",                                                                         group = "Window",     desc = "Go to upper window" },
      { "<C-l>",           "<C-w>l",                                                                         group = "Window",     desc = "Go to right window" },

      -- Folding
      { "<CR>",            "za",                                                                             group = "Folding",    desc = "Toggle fold" },
      { "<2-LeftMouse>",   "za",                                                                             group = "Folding",    desc = "Toggle fold (double-click)" },

      -- Command mode
      { ";",               ":",                                                                              group = "Command",    desc = "Enter command mode",               mode = { "n", "v" } },

      -- Clear search highlight
      { "<Esc>",           "<cmd>nohlsearch<CR>",                                                            group = "Search",     desc = "Clear search highlight" },

      -- Terminal mode exit
      { "<Esc><Esc>",      "<C-\\><C-n>",                                                                    group = "Terminal",   desc = "Exit terminal mode",               mode = "t" },
    })
  end,
}
