local function vim_opt_toggle(opt, on, off, name)
  return function()
    local message = name
    if vim.opt[opt]._value == off then
      vim.opt[opt] = on
      message = message .. " Enabled"
    else
      vim.opt[opt] = off
      message = message .. " Disabled"
    end
    vim.notify(message, "info", require("core.utils").base_notification)
  end
end

return {
  ["<leader>"] = {
    ["c"] = { "<cmd>Bdelete!<CR>", "Bye Buffer" },
    ["C"] = { "<cmd>bdelete!<cr>", "Close Buffer" },
    ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
    ["H"] = { "<cmd>set hlsearch!<cr>", "Toggle Highlight" },
    ["<cr>"] = { '<esc>/<++><cr>"_c4l', "Next Template" },
    ["z"] = { "<cmd>ZenMode<cr>", "Zen Mode" },

    f = {
      name = "Telescope",
      ["?"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      ["'"] = { "<cmd>Telescope marks<cr>", "Marks" },
      F = { "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", "All Files" },
      p = { "<cmd>Telescope project<cr>", "Projects" },
    },
  },
}
