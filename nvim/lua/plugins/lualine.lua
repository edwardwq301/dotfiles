return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup({
      options = {
        theme = 'auto',
        icons_enabled = true,
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
      },
      -- bottom
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {},
        lualine_x = {
          'encoding',
          -- 'fileformat',   -- unix, windows, apple
          'filetype'
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },

      tabline = {
        lualine_a = {},
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          {
            'tabs',
            mode = 2,
            tabs_color = {
              active = 'lualine_a_normal',     -- 使用 lualine 主题的活动颜色
              inactive = 'lualine_a_inactive', -- 使用 lualine 主题的非活动颜色
            },
          }
        }
      },

      winbar = {},
      inactive_winbar = {},
    })
  end
}
