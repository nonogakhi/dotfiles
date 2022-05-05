return {
  options = {
    dim_inactive = true,
    styles = {
      comments = "italic",
    },
    inverse = {
      match_paren = true,
    },
    modules = {
      barbar = false,
      dashboard = false,
      fern = false,
      fidget = false,
      gitgutter = false,
      glyph_palette = false,
      illuminate = false,
      lightspeed = false,
      lsp_saga = false,
      lsp_trouble = false,
      modes = false,
      neogit = false,
      nvimtree = false,
      pounce = false,
      sneak = false,
      symbols_outline = false,
    },
  },
  specs = {
    all = {
      telescope = {
        bg_alt = "bg2",
        bg = "bg1",
        fg = "fg1",
        green = "green",
        red = "red",
      },
    },
  },
  groups = {
    MiniIndentscopeSymbol = { link = "PreProc" },
    NormalFloat = { link = "Normal" },
    HighlightURL = { style = "underline" },
    TelescopeBorder = { fg = "telescope.bg_alt", bg = "telescope.bg" },
    TelescopeNormal = { bg = "telescope.bg" },
    TelescopePromptBorder = { fg = "telescope.bg_alt", bg = "telescope.bg_alt" },
    TelescopePromptNormal = { fg = "telescope.fg", bg = "telescope.bg_alt" },
    TelescopePromptPrefix = { fg = "telescope.red", bg = "telescope.bg_alt" },
    TelescopePreviewTitle = { fg = "telescope.bg", bg = "telescope.green" },
    TelescopePreviewBorder = { fg = "telescope.bg", bg = "telescope.bg" },
    TelescopePromptTitle = { fg = "telescope.bg", bg = "telescope.red" },
    TelescopeResultsTitle = { fg = "telescope.bg", bg = "telescope.bg" },
    TelescopeResultsBorder = { fg = "telescope.bg", bg = "telescope.bg" },
    LvimInfoHeader = { fg = "telescope.bg", bg = "telescope.green" },
    LvimInfoIdentifier = { fg = "telescope.red", bg = "telescope.bg_alt" },
  },
}
