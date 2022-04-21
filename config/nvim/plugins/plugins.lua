return {
  -- Add plugins, the packer syntax without the "use"
  init = require "user.plugins.init",

  -- All other entries override the setup() call for default plugins
  packer = {
    compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
  },
  ["neo-tree"] = require "user.plugins.neo-tree",
  bufferline = require "user.plugins.bufferline",
  lualine = require "user.plugins.lualine",
}
