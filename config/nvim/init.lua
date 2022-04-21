local colorscheme = "default_theme"
local theme_installed, _ = pcall(require, "catppuccin")
if theme_installed then
  colorscheme = "catppuccin"
end

return {
  colorscheme = colorscheme,
  enabled = require "user.core.default_plugins",
  plugins = require "user.plugins.plugins",
}
