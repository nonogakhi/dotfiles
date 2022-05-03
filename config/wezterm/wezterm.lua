local wezterm = require("wezterm")

return {
	-- Appearance
	color_scheme = "Duskfox",
	window_background_opacity = 0.9,

	-- Font
	font = wezterm.font_with_fallback({
		"JetBrains Mono",
		"nonicons",
	}),
	font_size = 14.0,

	-- Tabs/Panes
	hide_tab_bar_if_only_one_tab = false,

	-- Tab bar appearnace
	colors = {
		indexed = {
			[16] = "#F8BD96",
			[17] = "#F5E0DC",
		},

		scrollbar_thumb = "#575268",
		split = "#161320",

		tab_bar = {
			background = "#1E1E2E",
			active_tab = {
				bg_color = "#575268",
				fg_color = "#F5C2E7",
			},
			inactive_tab = {
				bg_color = "#1E1E2E",
				fg_color = "#D9E0EE",
			},
			inactive_tab_hover = {
				bg_color = "#575268",
				fg_color = "#D9E0EE",
			},
			new_tab = {
				bg_color = "#15121C",
				fg_color = "#6E6C7C",
			},
			new_tab_hover = {
				bg_color = "#575268",
				fg_color = "#D9E0EE",
				italic = true,
			},
		},

		visual_bell = "#302D41",

		-- nightbuild only
		compose_cursor = "#F8BD96",
	},
}
