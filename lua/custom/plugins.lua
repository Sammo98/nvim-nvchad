local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- Mine!
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {"tpope/vim-dadbod"},
    lazy=false
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = false,
    keys = {
      {"<leader>fe", "<cmd>:Telescope file_browser<cr>", desc = "Browse Files"}
    },
    config = function()
      require("telescope").load_extension("file_browser")
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function (_, opts)
      require("rust-tools").setup(opts)
    end
  },
  {
    {
      "chrisgrieser/nvim-spider",
      lazy = false,
      keys = {
        {"w", "<cmd> lua require('spider').motion('w')<CR>", mode = {"n", "o", "x"}},
        {"e", "<cmd> lua require('spider').motion('e')<CR>", mode = {"n", "o", "x"}},
        {"b", "<cmd> lua require('spider').motion('b')<CR>", mode = {"n", "o", "x"}},
      }
    }
  },



  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
