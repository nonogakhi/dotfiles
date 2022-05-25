vim.api.nvim_create_augroup("autocomp", { clear = true })
vim.api.nvim_create_autocmd("VimLeave", {
  desc = "Stop running auto compiler",
  group = "autocomp",
  pattern = "*",
  command = "!autocomp %:p stop",
})

vim.api.nvim_create_augroup("mini", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  desc = "Disable indent scope for content types",
  group = "mini",
  callback = function()
    if
      vim.tbl_contains({
        "NvimTree",
        "TelescopePrompt",
        "Trouble",
        "alpha",
        "help",
        "lsp-installer",
        "lspinfo",
        "neo-tree",
        "neogitstatus",
        "packer",
        "startify",
      }, vim.bo.filetype) or vim.tbl_contains({ "nofile", "terminal" }, vim.bo.buftype)
    then
      vim.b.miniindentscope_disable = true
    end
  end,
})
