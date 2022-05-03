return {
  -- Disable default plugins
  ["karb94/neoscroll.nvim"] = { disable = true },
  ["max397574/better-escape.nvim"] = { disable = true },
  ["lukas-reineke/indent-blankline.nvim"] = { disable = true },
  ["numToStr/Comment.nvim"] = { disable = true },
  {
    "EdenEast/nightfox.nvim", -- colorscheme/theme
    config = function()
      require("nightfox").setup(require "user.plugins.nightfox")
    end,
  },
  {
    "yamatsum/nvim-nonicons", -- font for icons
    requires = { "kyazdani42/nvim-web-devicons" },
  },
  {
    "danymat/neogen", -- annotation generator
    module = "neogen",
    cmd = "Neogen",
    config = function()
      require("neogen").setup(require "user.plugins.neogen")
    end,
    requires = "nvim-treesitter/nvim-treesitter",
  },
  {
    "andymass/vim-matchup", -- highlight, navigate, and operate on sets of matching text
    opt = true,
    setup = function()
      require("core.utils").defer_plugin "vim-matchup"
    end,
  },
  {
    "echasnovski/mini.nvim", -- collection of minimal, independent, and fast Lua modules
    opt = true,
    setup = function()
      require("core.utils").defer_plugin "mini.nvim"
    end,
    config = function()
      require "user.plugins.mini"()
    end,
  },
  {
    "ellisonleao/glow.nvim", -- markdown preview
    cmd = "Glow",
    module = "glow",
    setup = function()
      vim.g.glow_border = "rounded"
    end,
  },
  {
    "ethanholz/nvim-lastplace", -- reopen files at last edit position
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup(require "user.plugins.nvim-lastplace")
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    module = "zen-mode",
    config = function()
      require("zen-mode").setup(require "user.plugins.zen-mode")
    end,
  },
  {
    "hrsh7th/cmp-emoji",
    after = "nvim-cmp",
    config = function()
      require("core.utils").add_user_cmp_source "emoji"
    end,
  },
  {
    "lukas-reineke/headlines.nvim", -- highlights for text filetypes, like markdown
    ft = { "markdown", "rmd" },
    config = function()
      require("headlines").setup(require "user.plugins.headlines")
    end,
  },
  {
    "mickael-menu/zk-nvim", -- plain text note-taking assistant
    module = { "zk", "zk.commands" },
    config = function()
      require("zk").setup(require "user.plugins.zk")
    end,
  },
  {
    "phaazon/hop.nvim",
    opt = true,
    setup = function()
      require("core.utils").defer_plugin "hop.nvim"
    end,
    branch = "v1",
    cmd = {
      "HopChar1CurrentLine",
      "HopChar2",
    },
    config = function()
      require("hop").setup()
    end,
  },
  { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    after = "telescope.nvim",
    module = "telescope._extensions.file_browser", -- lazy-load
    config = function()
      require("telescope").load_extension "file_browser"
    end,
  },
  {
    "nvim-telescope/telescope-hop.nvim",
    after = "telescope.nvim",
    module = "telescope._extensions.hop", -- lazy-load
    config = function()
      require("telescope").load_extension "hop"
    end,
  },
  {
    "nvim-telescope/telescope-project.nvim",
    after = "telescope.nvim",
    module = "telescope._extensions.project", -- lazy-load
    config = function()
      require("telescope").load_extension "project"
    end,
  },
  {
    "benfowler/telescope-luasnip.nvim",
    after = "telescope.nvim",
    module = "telescope._extensions.luasnip", -- lazy-load
    config = function()
      require("telescope").load_extension "luasnip"
    end,
  },
  { "ziontee113/syntax-tree-surfer", module = "syntax-tree-surfer" },
}
