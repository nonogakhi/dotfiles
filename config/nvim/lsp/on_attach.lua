return function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  if client.name == "solargraph" and vim.o.filetype == "ruby" then
    client.resolved_capabilities.document_formatting = false
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Format on save
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_create_augroup("autoformat", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      desc = "Auto format before save",
      group = "autoformat",
      pattern = "<buffer>",
      callback = vim.lsp.buf.formatting_sync,
    })
  end
end
