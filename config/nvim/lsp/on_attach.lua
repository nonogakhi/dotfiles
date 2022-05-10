return function(client, bufnr)
  if client.name == "solargraph" and vim.o.filetype == "ruby" then
    client.resolved_capabilities.document_formatting = false
  end

  -- Format on save
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_create_autocmd("BufWritePre", {
      desc = "Auto format before save",
      pattern = "<buffer>",
      callback = vim.lsp.buf.formatting_sync,
    })
  end
end
