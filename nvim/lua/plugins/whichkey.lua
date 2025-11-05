return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = { preset = "modern" },
  config = function()
    local wk = require("which-key")

    -- Register all mappings using the official spec
    wk.add({
      -- Group definitions
      { "<leader>d",  group = "Debugger" },
      { "<leader>f",  group = "find" },
      { "<leader>F",  group = "File" },
      { "<leader>g",  group = "Git" },
      { "<leader>l",  group = "Lsp" },
      { "<leader>s",  group = "Search" },
      { "<leader>w",  group = "Window" },
      { "<leader>t",  group = "Toggle" },

      -- General
      { "<leader>Fw", "<cmd>w!<CR>",     desc = "Save", nowait = true, remap = false },
      {
        "<leader>tw",
        function()
          if vim.o.wrap then
            vim.o.wrap = false
          else
            vim.o.wrap = true
          end
        end,
        desc = "Toggle wrap"
      },
      -- LSP
      { "<leader>la",  vim.lsp.buf.code_action,   desc = "Show code actions" },
      { "<leader>lq",  vim.diagnostic.setloclist, desc = "Open diagnostic quickfix list" },

      -- Window Management
      { "<leader>w\\", "<cmd>vsp<CR>",            desc = "Vertical split" },
      { "<leader>w-",  "<cmd>sp<CR>",             desc = "Horizontal split" },
      { "<leader>wh",  "<C-w>h",                  desc = "Go to left window" },
      { "<leader>wj",  "<C-w>j",                  desc = "Go to lower window" },
      { "<leader>wk",  "<C-w>k",                  desc = "Go to upper window" },
      { "<leader>wl",  "<C-w>l",                  desc = "Go to right window" },
      { "<leader>wq",  "<C-w>c",                  desc = "Close window" },
      { "<leader>wo",  "<C-w>o",                  desc = "Close other windows" },
      { "<leader>w=",  "<C-w>=",                  desc = "Balance windows" },
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
    vim.keymap.set('n', '<leader>tx', function()
      local view = vim.fn.winsaveview()
      vim.cmd([[keeppatterns %s/\s\+$//e]])
      vim.fn.winrestview(view)
      print("✓ Trailing whitespace removed")
    end, { desc = 'Trim trailing whitespace' })

    -- Folding
    vim.keymap.set("n", "<CR>", "za", { desc = "Toggle fold" })

    -- Command mode
    vim.keymap.set({ "n", "v" }, ";", ":", { desc = "Enter command mode" })
  end,
}
