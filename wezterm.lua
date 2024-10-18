local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
config.launch_menu = {}
-- This is where you actually apply your config choices

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    -- win use git bash
    config.default_prog = { 'D:/GIT/Git/bin/bash.exe ' }

    table.insert(config.launch_menu, {
        label = 'ssh de-wq',
        args = { 'D:/GIT/Git/usr/bin/ssh.exe', 'de-wq' }
    })
    table.insert(config.launch_menu, {
        label = 'pwsh',
        args = { 'pwsh.exe', '--Nologo' }
    })
elseif wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
    table.insert(config.launch_menu, {
        label = 'fish',
        args = { '/usr/bin/fish' }
    })
end

config.color_scheme = 'Catppuccin Macchiato'
config.font = wezterm.font_with_fallback { 'Hack', '思源黑体 CN' }
config.font_size = 16

config.window_close_confirmation = 'NeverPrompt'
config.audible_bell = 'Disabled'
config.skip_close_confirmation_for_processes_named = { 'bash', 'sh', 'zsh', 'fish', 'tmux', 'nu', 'cmd.exe', 'pwsh.exe',
    'powershell.exe', 'bash.exe' }
-- 透明背景
config.window_background_opacity = 1.0
-- 取消 Windows 原生标题栏
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
-- 滚动条尺寸为 15 ，其他方向不需要 pad
config.window_padding = {
    left = 0,
    right = 15,
    top = 0,
    bottom = 0
}
config.enable_scroll_bar = true

-- keys绑定
config.leader = {
    key = 'a',
    mods = 'CTRL|ALT',
    timeout_milliseconds = 2000
}
config.keys = { {
    key = 'F11',
    mods = 'NONE',
    action = wezterm.action.ToggleFullScreen
}, {
    -- 新tab
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.ShowLauncher
}, {
    key = '&',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.CloseCurrentTab {
        confirm = false
    }
}, {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical {
        domain = 'CurrentPaneDomain'
    }
}, {
    key = '|',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitHorizontal {
        domain = 'CurrentPaneDomain'
    }
}, {
    key = 'x',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane {
        confirm = false
    }
} }

-- and finally, return the configuration to wezterm
return config
