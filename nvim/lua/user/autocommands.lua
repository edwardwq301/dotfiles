-- Create augroup for general settings
local general_settings_group = vim.api.nvim_create_augroup("_general_settings", { clear = true })

-- ==============================================================================
-- FileType Specific Settings
-- ==============================================================================

-- Enable spell check for text-based file types
vim.api.nvim_create_autocmd("FileType", {
  group = general_settings_group,
  pattern = { "markdown", "text", "gitcommit", "latex", "tex" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
  end,
  desc = "Enable spell check for text-based file types"
})

-- Set 2-space indentation for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = general_settings_group,
  pattern = {
    "python","yml", "yaml", "json", "html", "css",
    "javascript", "typescript", "sh", "sql",
    "vue", "markdown"
  },
  callback = function()
    vim.opt_local.shiftwidth = 2        -- Indentation width
    vim.opt_local.tabstop = 2           -- Tab character width
    vim.opt_local.softtabstop = 2       -- Soft tab width
  end,
  desc = "Set 2-space indentation for specific filetypes"
})

-- Quick close mapping for special buffers
vim.api.nvim_create_autocmd("FileType", {
  group = general_settings_group,
  pattern = { "qf", "help", "man", "lspinfo", "checkhealth" },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = true, silent = true })
  end,
  desc = "Map 'q' to close special buffers"
})

-- Don't list quickfix buffers in buffer list
vim.api.nvim_create_autocmd("FileType", {
  group = general_settings_group,
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
  desc = "Exclude quickfix buffers from buffer list"
})

-- ==============================================================================
-- General Buffer Settings
-- ==============================================================================

-- Disable auto-commenting for all buffers
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = general_settings_group,
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  desc = "Disable automatic comment formatting"
})


vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = general_settings_group,
  callback = function()
    vim.hl.on_yank()
  end,
})