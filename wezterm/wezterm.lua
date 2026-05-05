local wezterm = require("wezterm")
local config = {}

-- フォント
config.font = wezterm.font("JetBrainsMono Nerd Font")

-- フォントサイズ
config.font_size = 13.0

-- 背景透過
config.window_background_opacity = 0.5

-- macOS blur
config.macos_window_background_blur = 20

-- タブ1つなら非表示
config.hide_tab_bar_if_only_one_tab = true

-- 自動リロード
config.automatically_reload_config = true

config.keys = {
	-- 縦分割（左右）
	{ key = "d", mods = "CMD", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	-- 横分割（上下）
	{ key = "d", mods = "CMD|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- ペイン移動
	{ key = "h", mods = "SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "k", mods = "SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "j", mods = "SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },
}

return config
