return {
  colorscheme = pcall(require, "nightfox") and "duskfox" or "default_theme",
  lsp = require "users.lsp",

  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      emoji = 700,
      pandoc_references = 700,
      latex_symbols = 700,
      calc = 650,
      path = 500,
      buffer = 250,
    },
  },

  polish = function()
    require "users.options"
    require "users.autocmds"
    require "users.mappings"
  end,
}
