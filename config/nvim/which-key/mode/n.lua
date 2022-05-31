local utils = require "user.utils"
return {
  ["<leader>"] = {
    ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
    ["H"] = { "<cmd>set hlsearch!<cr>", "Toggle Highlight" },
    ["z"] = { "<cmd>ZenMode<cr>", "Zen Mode" },

    a = {
      name = "Annotate",
      ["<cr>"] = {
        function()
          require("neogen").generate()
        end,
        "Current",
      },
      c = {
        function()
          require("neogen").generate { type = "class" }
        end,
        "Class",
      },
      f = {
        function()
          require("neogen").generate { type = "func" }
        end,
        "Function",
      },
      t = {
        function()
          require("neogen").generate { type = "type" }
        end,
        "Type",
      },
      F = {
        function()
          require("neogen").generate { type = "file" }
        end,
        "File",
      },
    },

    d = {
      name = "Document",
      n = { "<cmd>enew<cr>", "New File" },
      s = { "<cmd>setlocal spell!<cr>", "Toggle Spelling" },
      t = { "<cmd>TableModeToggle<cr>", "Toggle Table Mode" },
      p = { "<cmd>setlocal paste!<cr>", "Toggle Paste" },
      c = {
        function()
          utils.vim_opt_toggle("conceallevel", 2, 0, "Conceal")
        end,
        "Toggle Conceal",
      },
      w = {
        function()
          utils.vim_opt_toggle("wrap", true, false, "Soft Wrap")
        end,
        "Toggle Soft Wrapping",
      },
      W = {
        function()
          utils.vim_opt_toggle("textwidth", 80, 0, "Hard Wrap")
        end,
        "Toggle Hard Wrapping",
      },
      m = { ":MarkdownPreviewToggle<CR>", "Toggle Preview Markdown" },
    },

    f = {
      name = "Telescope",
      ["?"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      ["'"] = { "<cmd>Telescope marks<cr>", "Marks" },
      F = { "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", "All Files" },
      p = { "<cmd>Telescope project<cr>", "Projects" },
    },

    s = {
      name = "Surf",
      s = {
        function()
          require("syntax-tree-surfer").select()
        end,
        "Surf",
      },
      S = {
        function()
          require("syntax-tree-surfer").select_current_node()
        end,
        "Surf Node",
      },
    },

    n = {
      name = "Notes",
      b = {
        function()
          require "zk.commands" "ZkBacklinks"()
        end,
        "Backlink Picker",
      },
      d = {
        function()
          require "zk.commands" "ZkCd"()
        end,
        "Change Directory",
      },
      r = {
        function()
          require "zk.commands" "ZkIndex"()
        end,
        "Refresh Index",
      },
      l = {
        function()
          require "zk.commands" "ZkLinks"()
        end,
        "Link Picker",
      },
      s = {
        function()
          require("zk.commands").get "ZkNotes" { sort = { "modified" } }
        end,
        "Search",
      },
      p = {
        function()
          require("zk.commands").get "ZkNew" { dir = "personal", title = vim.fn.input "Title: " }
        end,
        "New Personal Note",
      },
      w = {
        function()
          require("zk.commands").get "ZkNew" { dir = "work", title = vim.fn.input "Title: " }
        end,
        "New Work Note",
      },
      n = {
        function()
          require("zk.commands").get "ZkNew" { dir = "daily" }
        end,
        "New Daily Note",
      },
      t = {
        function()
          require("zk.commands").get "ZkTags"()
        end,
        "Tags",
      },
    },
  },
}
