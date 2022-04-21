return {
  {
    -- Colorscheme
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
}
