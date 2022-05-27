M = {}

function M.vim_opt_toggle(opt, on, off, name)
  local message = name
  if vim.opt[opt]._value == off then
    vim.opt[opt] = on
    message = message .. " Enabled"
  else
    vim.opt[opt] = off
    message = message .. " Disabled"
  end
  vim.notify(message, "info", astronvim.base_notification)
end

return M
