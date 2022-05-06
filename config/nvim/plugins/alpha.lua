local utils = require "core.utils"
local plugins_started = vim.fn.len(vim.fn.globpath(vim.fn.stdpath "data" .. "/site/pack/packer/start", "*", 0, 1))
local plugins_count = plugins_started
  + vim.fn.len(vim.fn.globpath(vim.fn.stdpath "data" .. "/site/pack/packer/opt", "*", 0, 1))

return {
  layout = {
    { type = "padding", val = 2 },
    {
      type = "text",
      val = utils.user_plugin_opts("header", nil, false),
      opts = {
        position = "center",
        hl = "DashboardHeader",
      },
    },
    { type = "padding", val = 2 },
    {
      type = "group",
      val = {
        utils.alpha_button("LDR f f", "  Find File  "),
        utils.alpha_button("LDR f o", "  Recents  "),
        utils.alpha_button("LDR f w", "  Find Word  "),
        utils.alpha_button("LDR f p", "  Projects  "),
        utils.alpha_button("LDR f n", "  New File  "),
        utils.alpha_button("LDR f m", "  Bookmarks  "),
        utils.alpha_button("LDR S l", "  Last Session  "),
      },
      opts = {
        spacing = 1,
      },
    },
    {
      type = "text",
      val = {
        " ",
        " ",
        " ",
        " AstroNvim loaded " .. plugins_started .. " on total " .. plugins_count .. " plugins ",
      },
      opts = {
        position = "center",
        hl = "DashboardFooter",
      },
    },
  },
}
