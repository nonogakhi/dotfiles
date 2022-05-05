return function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  if client.name == "solargraph" and vim.o.filetype == "ruby" then
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_augroup("autoformat", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      desc = "Auto format before save",
      group = "autoformat",
      pattern = "<buffer>",
      callback = vim.lsp.buf.formatting_sync,
    })
  end
end
