local wezterm = require 'wezterm'
local act = wezterm.action
local M = {}

M.leader = { key = "i", mods = "CTRL" }

local keys = {
	{ key = "c", mods = "LEADER", action = "ShowLauncher" },
	{ key = "f", mods = "LEADER", action = "QuickSelect" },

	{ key = "j", mods = "LEADER", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "h", mods = "LEADER", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },

	{ key = "1", mods = "LEADER", action = act({ ActivateTab = 0 }) },
	{ key = "2", mods = "LEADER", action = act({ ActivateTab = 1 }) },
	{ key = "3", mods = "LEADER", action = act({ ActivateTab = 2 }) },
	{ key = "4", mods = "LEADER", action = act({ ActivateTab = 3 }) },

	{ key = "j", mods = "ALT",    action = act({ ActivatePaneDirection = "Down" }) },
	{ key = "k", mods = "ALT",    action = act({ ActivatePaneDirection = "Up" }) },
	{ key = "h", mods = "ALT",    action = act({ ActivatePaneDirection = "Left" }) },
	{ key = "l", mods = "ALT",    action = act({ ActivatePaneDirection = "Right" }) },

	{ key = "+", mods = "ALT",    action = act({ ActivateTabRelative = 1 }) },
	{ key = "-", mods = "ALT",    action = act({ ActivateTabRelative = -1 }) },
}

local mouse = {
	{
		event = { Up = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = act({ CopyTo = "ClipboardAndPrimarySelection" }),
	},
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = act({ CompleteSelection = "PrimarySelection" }),
	},
	{
		event = { Up = { streak = 2, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	}
}

M.keys = keys
M.mouse = mouse

return M
