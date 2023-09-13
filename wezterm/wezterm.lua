local wezterm = require 'wezterm'
local mappings = require('mappings')

local config = {}

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

-- 按键绑定在单独的文件中
config.keys = mappings.keys
config.mouse_bindings = mappings.mouse

return config
