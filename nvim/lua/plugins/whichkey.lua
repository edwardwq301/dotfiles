return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = { preset = "modern" },
  config = function()
    local wk = require("which-key")

    -- Register all mappings using the official spec
    wk.add({
      -- Group definitions
      { "<leader>d", group = "Debugger" },
      { "<leader>f", group = "find" },
      { "<leader>F", group = "File" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "Lsp" },
      { "<leader>s", group = "Search" },
      { "<leader>w", group = "Window" },

      -- General
      { "<leader>Fw", "<cmd>w!<CR>", desc = "Save", nowait = true, remap = false },

      -- Top Pickers & Explorer
      { "<leader><space>", function() require("snacks").picker.smart({ filter = { cwd = true } }) end, desc = "Smart Find Files" },
      { "<leader>/", function() require("snacks").picker.grep({ hidden = true }) end, desc = "Grep" },
      { "<leader>e", function() require("snacks").explorer() end, desc = "File Explorer" },

      -- Find
      { "<leader>fb", function() require("snacks").picker.buffers() end, desc = "Buffers" },
      { "<leader>ff", function() require("snacks").picker.files({ hidden = true, ignored = true }) end, desc = "Find Files" },

      -- Git
      { "<leader>gb", function() require("snacks").picker.git_branches() end, desc = "Git Branches" },
      { "<leader>gl", function() require("snacks").picker.git_log() end, desc = "Git Log" },
      { "<leader>gL", function() require("snacks").picker.git_log_line() end, desc = "Git Log Line" },
      { "<leader>gs", function() require("snacks").picker.git_status() end, desc = "Git Status" },
      { "<leader>gS", function() require("snacks").picker.git_stash() end, desc = "Git Stash" },
      { "<leader>gd", function() require("snacks").picker.git_diff() end, desc = "Git Diff (Hunks)" },
      { "<leader>gf", function() require("snacks").picker.git_log_file() end, desc = "Git Log File" },
      { "<leader>gB", function() require("snacks").gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
      { "<leader>gg", function() require("snacks").lazygit() end, desc = "Lazygit" },

      -- Search
      { "<leader>sb", function() require("snacks").picker.lines() end, desc = "Buffer Lines" },
      { "<leader>sd", function() require("snacks").picker.diagnostics() end, desc = "Diagnostics" },
      { "<leader>sD", function() require("snacks").picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },

      -- LSP
      { "<leader>la", vim.lsp.buf.code_action, desc = "Show code actions" },
       { "<leader>lq", vim.diagnostic.setloclist, desc = "Open diagnostic quickfix list" },

      -- LSP Navigation
      { "gd", function() require("snacks").picker.lsp_definitions() end, desc = "Go to Definition" },
      { "gD", function() require("snacks").picker.lsp_declarations() end, desc = "Go to Declaration" },
      { "gr", function() require("snacks").picker.lsp_references() end, desc = "References", nowait = true },
      { "gI", function() require("snacks").picker.lsp_implementations() end, desc = "Go to Implementation" },
      { "gy", function() require("snacks").picker.lsp_type_definitions() end, desc = "Go to Type Definition" },

      -- Window Management
      { "<leader>w\\", "<cmd>vsp<CR>", desc = "Vertical split" },
      { "<leader>w-", "<cmd>sp<CR>", desc = "Horizontal split" },
      { "<leader>wh", "<C-w>h", desc = "Go to left window" },
      { "<leader>wj", "<C-w>j", desc = "Go to lower window" },
      { "<leader>wk", "<C-w>k", desc = "Go to upper window" },
      { "<leader>wl", "<C-w>l", desc = "Go to right window" },
      { "<leader>wq", "<C-w>c", desc = "Close window" },
      { "<leader>wo", "<C-w>o", desc = "Close other windows" },
      { "<leader>w=", "<C-w>=", desc = "Balance windows" },
    })

    -- Direct mappings (not managed by which-key)
    
    -- Clear search highlight
    vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })
    
    -- Terminal mode exit
    vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
    
    -- Navigation
    vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Move down (line-wrap aware)" })
    vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Move up (line-wrap aware)" })
    vim.keymap.set({ "n", "v" }, "L", "g_", { desc = "Go to line end" })
    vim.keymap.set({ "n", "v" }, "H", "^", { desc = "Go to line start" })

    -- Scrolling
    vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down with cursor centering" })
    vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up with cursor centering" })

    -- Editing
    vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Delete previous word" })
    vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })
    vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
    vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move selection down" })
    vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move selection up" })
    vim.keymap.set({ "n", "v" }, "<C-/>", "gc", { remap = true, desc = "Toggle comment" })

    -- Window navigation
    vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
    vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
    vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
    vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

    -- Folding
    vim.keymap.set("n", "<CR>", "za", { desc = "Toggle fold" })
    vim.keymap.set("n", "<2-LeftMouse>", "za", { desc = "Toggle fold (double-click)" })

    -- Command mode
    vim.keymap.set({ "n", "v" }, ";", ":", { desc = "Enter command mode" })
  end,
}