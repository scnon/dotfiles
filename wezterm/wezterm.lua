local wezterm = require 'wezterm'
local mappings = require('mappings')

if wezterm.config_builder then
    config = wezterm.config_builder(config)
end

local config = {
    font_size = 14.0,
    font = wezterm.font('Maple Mono SC NF', { weight = 'Bold' }),

    -- 隐藏新建标签页按钮
    show_new_tab_button_in_tab_bar = false,
    -- 隐藏标签页栏
    hide_tab_bar_if_only_one_tab = true,
    window_background_opacity = 0.75,

    window_decorations = 'NONE | RESIZE',
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    keys = mappings.keys,
    mouse_bindings = mappings.mouse,

}

return config
