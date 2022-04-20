local colorscheme = "default_theme"
local theme_installed, _ = pcall(require, "catppuccin")
if theme_installed then
  colorscheme = "catppuccin"
end

return {
  colorscheme = colorscheme,

  plugins = {
    init = {
      -- Colorscheme
      {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
          require("catppuccin").setup {}
        end,
      },
      -- Font for icons
      {
        "yamatsum/nvim-nonicons",
         requires = {"kyazdani42/nvim-web-devicons"}
      }
    },
    lualine = {
      options = {
        theme = "catppuccin",
      }
    },
    ["neo-tree"] = {
      window = {
        position = "right",
        width = 35,
      }
    }
  },
}
