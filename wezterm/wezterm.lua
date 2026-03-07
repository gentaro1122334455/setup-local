local wezterm = require("wezterm")
local config = {}

-- フォント
config.font = wezterm.font("JetBrainsMono Nerd Font")

-- フォントサイズ
config.font_size = 13.0

-- 背景透過
config.window_background_opacity = 0.7

-- macOS blur
config.macos_window_background_blur = 20

-- タブ1つなら非表示
config.hide_tab_bar_if_only_one_tab = true

-- 自動リロード
config.automatically_reload_config = true

return config
