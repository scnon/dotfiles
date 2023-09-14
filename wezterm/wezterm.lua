local wezterm = require 'wezterm'
local mappings = require('mappings')

local config = {}
local launch_menu = {}
local default_prog = {}

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    table.insert(launch_menu, {
        label = 'NuShell',
        args = {'nu.exe'},
    })

    table.insert(launch_menu, {
        label = 'PowerShell',
        args = {'powershell.exe', '-NoLogo'},
    })

    table.insert(launch_menu, {
        label = "Arch",
        args = {"wsl", "-d", "Arch", "zsh"},
    })
    default_prog = { "nu.exe" }
end

local baseName = function(s)
    return string.gsub( s, '(.*[/\\])(.*)', '%2' )
end

wezterm.on( 'format-tab-title', function( tab, tabs, panes, config, hover, max_width )
    local pane = tab.active_pane

    local index = ""
    if #tabs > 1 then
        index = string.format( "%d: ", tab.tab_index + 1 )
    end

    local process = baseName( pane.foreground_process_name )

    return { {
        Text = ' ' .. index .. process .. ' '
     } }
end )

if wezterm.config_builder then
    config = wezterm.config_builder(config)
end

-- 窗口设置
config.window_background_opacity = 0.75
config.window_decorations = 'NONE | RESIZE'
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

-- 字体
config.font_size = 13.0
config.font = wezterm.font('Maple Mono SC NF')

-- 环境
config.set_environment_variables = {
    COMSPEC = 'C:\\Program Files\\nu\\bin\\nu.exe'
}

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

config.default_prog = default_prog

return config
