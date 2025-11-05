-- ==============================================================================
-- Basic Settings
-- ==============================================================================

-- UI Display
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.cursorline = true     -- Highlight current line
vim.opt.laststatus = 3        -- Global statusline
vim.opt.showmode = false      -- Don't show mode indicator (e.g., -- INSERT --)
vim.opt.showtabline = 1       -- 0: Hide tabline 1: hide when 1 file, show when 1+ files
vim.opt.cmdheight = 0         -- Dynamic command line height
vim.opt.signcolumn = "yes"    -- Always show sign column

-- Scrolling
vim.opt.scrolloff = 8     -- Vertical scroll margin
vim.opt.sidescrolloff = 8 -- Horizontal scroll margin

-- Text Wrapping
vim.o.breakindent = true -- Enable wrapped line indentation
vim.o.linebreak = true -- Break at word boundaries
vim.o.showbreak = '↳ ' -- Show wrap character
vim.opt.textwidth = 80 -- Text width limit

-- File Handling
vim.opt.swapfile = false    -- Disable swap files
vim.opt.undofile = false    -- Disable persistent undo
vim.opt.writebackup = false -- Disable backup files
vim.opt.confirm = true      -- Confirm dialog for unsaved changes

-- Fold
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99 --The higher the more folded regions are open.
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = "0"

_G.custom_fold_text = function()
  local lines = vim.v.foldend - vim.v.foldstart + 1
  local first_line = vim.fn.getline(vim.v.foldstart)
  first_line = vim.fn.substitute(first_line, '^\\s*', '', '')

  local text = first_line .. ' ... ' .. lines .. ' lines'
  local width = vim.fn.winwidth(0) -- 获取当前窗口宽度

  -- 保留原始缩进，文本右对齐
  local indent = string.rep(' ', vim.fn.indent(vim.v.foldstart))
  local content_width = width - vim.fn.strwidth(indent) - 2
  local padding = string.rep(' ', math.max(0, content_width - vim.fn.strwidth(text)))

  return indent .. text .. padding
end

vim.opt.foldtext = 'v:lua._G.custom_fold_text()'

-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- ==============================================================================
-- Search & Highlight
-- ==============================================================================

vim.opt.hlsearch = true      -- Highlight search results
vim.opt.ignorecase = true    -- Case-insensitive search
vim.opt.smartcase = true     -- Smart case sensitivity
vim.opt.inccommand = 'split' -- Live substitution preview

-- ==============================================================================
-- Editing Behavior
-- ==============================================================================

-- Indentation
vim.opt.smartindent = true -- Smart autoindenting
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.shiftwidth = 4     -- Autoindent width
vim.opt.tabstop = 4        -- Tab character width

-- Invisible Characters
vim.opt.list = true -- Show invisible characters
vim.opt.listchars = {
  tab = '» ', -- Tab character display
  trail = '·', -- Trailing spaces
  nbsp = '␣' -- Non-breaking spaces
}

-- ==============================================================================
-- Completion Settings
-- ==============================================================================

vim.opt.completeopt = { "menuone", "noselect" } -- Completion options
vim.opt.pumheight = 10                          -- Completion menu height limit
vim.opt.shortmess:append("cI")                  -- Reduce completion messages, disable intro
-- ==============================================================================
-- Keyboard & Mouse
-- ==============================================================================

vim.opt.mouse = "a"      -- Enable mouse in all modes
vim.opt.timeoutlen = 50  -- Key mapping timeout
vim.opt.updatetime = 300 -- Update interval for CursorHold events

-- ==============================================================================
-- Appearance & Theme
-- ==============================================================================

vim.opt.termguicolors = true -- Enable true color support
vim.g.have_nerd_font = true  -- Use Nerd Font

-- Window Splitting
vim.opt.splitbelow = true -- New windows split below
vim.opt.splitright = true -- New windows split right

-- Font Settings
vim.opt.guifont = "Hack:h16,Fira Code:h16,Source Han Sans SC:h16"

-- ==============================================================================
-- Clipboard & Spelling
-- ==============================================================================

vim.opt.clipboard = "unnamedplus" -- System clipboard integration
vim.opt.spell = false             -- Spell checking
vim.opt.spelllang = "en_us"       -- Spell check language

-- ==============================================================================
-- Plugin Specific Settings
-- ==============================================================================

-- Snacks plugin: disable animations
vim.g.snacks_animate = false
