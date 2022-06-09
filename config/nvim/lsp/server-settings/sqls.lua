return {
  on_attach = function(client, bufnr)
    if client.name == "sqls" then
      require("sqls").on_attach(client, bufnr)
    end
  end,
  settings = {
    sqls = {
      connections = {
        {
          driver = "postgresql",
          dataSourceName = "host=127.0.0.1 port=5432 user=thieunv dbname=fb2s_db sslmode=disable",
        },
      },
    },
  },
}
