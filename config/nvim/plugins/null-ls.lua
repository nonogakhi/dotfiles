-- Formatting and linting
-- https://github.com/jose-elias-alvarez/null-ls.nvim
local status_ok, null_ls = pcall(require, "null-ls")
if status_ok then
  local builtins = null_ls.builtins
  local on_attach = require "user.lsp.on_attach"

  null_ls.setup {
    debug = true,
    sources = {
      -- Completion
      builtins.completion.spell,
      -- Formatting
      builtins.formatting.stylua, -- Lua
      builtins.formatting.shfmt, -- Shell
      builtins.formatting.prettierd.with {
        filetypes = { "javascript", "typescript", "css", "scss", "html", "yaml", "markdown", "json" },
      },
      -- Linters
      builtins.diagnostics.rubocop, -- Ruby
      builtins.diagnostics.write_good, -- Markdown
      builtins.diagnostics.tsc, -- Typescript
      builtins.diagnostics.shellcheck.with {
        diagnostics_format = "#{m} [#{c}]",
      },
      builtins.diagnostics.luacheck.with {
        extra_args = { "--global vim" },
      },
      -- Code Actions
      builtins.code_actions.gitsigns,
      builtins.code_actions.gitrebase,
      builtins.code_actions.shellcheck,
      -- Hover
      builtins.hover.dictionary,
    },
    on_attach = on_attach,
  }
end
