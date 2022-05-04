local cmp_ok, cmp = pcall(require, "cmp")
local luasnip_ok, luasnip = pcall(require, "luasnip")
if cmp_ok and luasnip_ok then
  local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = "",
  }

  return {
    formatting = {
      fields = { "abbr", "kind", "menu" },
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
        -- Source
        vim_item.menu = ({
          buffer = "Buf",
          nvim_lsp = "LSP",
          luasnip = "LuaSnip",
          nvim_lua = "Lua",
          latex_symbols = "LaTeX",
          cmp_tabnine = "Tabnine",
          path = "Path",
          emoji = "Emoji",
        })[entry.source.name]
        return vim_item
      end,
    },
    mapping = {
      ["<CR>"] = cmp.mapping.confirm(),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        elseif cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
  }
else
  return {}
end
