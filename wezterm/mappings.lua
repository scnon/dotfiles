local wezterm = require 'wezterm'
local act = wezterm.action
local M = {}

local keys = {
	{ key = "j", mods = "ALT|SHIFT", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "l", mods = "ALT|SHIFT", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "h", mods = "CMD", action = act({ ActivatePaneDirection = "Left" }) },
	{ key = "l", mods = "CMD", action = act({ ActivatePaneDirection = "Right" }) },
	{ key = "k", mods = "CMD", action = act({ ActivatePaneDirection = "Up" }) },
	{ key = "j", mods = "CMD", action = act({ ActivatePaneDirection = "Down" }) },
  { key = "1", mods = "ALT", action = act({ ActivateTab = 0 }) },
  { key = "2", mods = "ALT", action = act({ ActivateTab = 1 }) },
  { key = "3", mods = "ALT", action = act({ ActivateTab = 2 }) },
}

local mouse = {
	{
		event = { Up = { streak = 1, button = "Right" }},
		mods = "NONE",
		action = act({ PasteFrom = "Clipboard" }),
	},
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = act({ CompleteSelection = "PrimarySelection" }),
	},
}

M.keys = keys
M.mouse = mouse

return M

