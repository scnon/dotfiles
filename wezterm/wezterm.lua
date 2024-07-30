local wezterm = require 'wezterm'
local mappings = require('mappings')

local mux = wezterm.mux
local config = {}
local launch_menu = {}
local default_prog = {}

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    table.insert(launch_menu, {
        label = 'MSYS 2',
        args = {
            "C:\\Users\\x\\scoop\\apps\\msys2\\current\\msys2_shell.cmd",
            "-defterm",
            "-here",
            "-no-start",
            "-shell",
            "zsh",
            "-mingw64"
        },
    })

    table.insert(launch_menu, {
        label = 'PowerShell',
        args = { 'powershell.exe', '-NoLogo' },
    })

    table.insert(launch_menu, {
        label = "Arch",
        args = { "wsl", "-d", "Arch", "zsh" },
    })
    default_prog = {
        "C:\\Users\\x\\scoop\\apps\\msys2\\current\\msys2_shell.cmd",
        "-defterm",
        "-here",
        "-no-start",
        "-shell",
        "zsh",
        "-mingw64"
    }
end

local baseName = function(s)
    return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local pane = tab.active_pane

    local index = ""
    if #tabs > 1 then
        index = string.format("%d: ", tab.tab_index + 1)
    end

    local process = baseName(pane.foreground_process_name)

    return { {
        Text = ' ' .. index .. process .. ' '
    } }
end)

wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():set_position(2150, 120)
end)

if wezterm.config_builder then
    config = wezterm.config_builder(config)
end

-- 窗口设置
config.window_background_opacity = 0.86
config.window_decorations = 'NONE | RESIZE'
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

-- 字体
config.font_size = 12.0
config.font = wezterm.font('Maple Mono SC NF')

config.initial_cols = 160
config.initial_rows = 42

-- 隐藏新建标签页按钮
config.show_new_tab_button_in_tab_bar = false
-- 隐藏标签页栏
config.hide_tab_bar_if_only_one_tab = true
-- 隐藏标签页栏中的序号
config.show_tab_index_in_tab_bar = false
config.tab_max_width = 25

-- 按键绑定在单独的文件中
config.keys = mappings.keys
config.leader = mappings.leader
config.mouse_bindings = mappings.mouse

config.launch_menu = launch_menu
config.default_prog = default_prog

return config
