return function(client, bufnr)
  if client.name == "sqls" then
    require("sqls").on_attach(client, bufnr)
  end

  if vim.tbl_contains({
    "solargraph",
    "gopls",
  }, client.name) then
    astronvim.lsp.disable_formatting(client)
  end
end
