-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            " █████╗ ██╗     ███████╗██╗  ██╗███████╗██╗   ██╗    ██╗██████╗ ███████╗",
            "██╔══██╗██║     ██╔════╝╚██╗██╔╝██╔════╝╚██╗ ██╔╝    ██║██╔══██╗██╔════╝",
            "███████║██║     █████╗   ╚███╔╝ █████╗   ╚████╔╝     ██║██║  ██║█████╗  ",
            "██╔══██║██║     ██╔══╝   ██╔██╗ ██╔══╝    ╚██╔╝      ██║██║  ██║██╔══╝  ",
            "██║  ██║███████╗███████╗██╔╝ ██╗███████╗   ██║       ██║██████╔╝███████╗",
            "╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝       ╚═╝╚═════╝ ╚══════╝",
            "",
            " █████╗ ███████╗████████╗██████╗  ██████╗ ██╗   ██╗██╗███╗   ███╗",
            "██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗██║   ██║██║████╗ ████║",
            "███████║███████╗   ██║   ██████╔╝██║   ██║██║   ██║██║██╔████╔██║",
            "██╔══██║╚════██║   ██║   ██╔══██╗██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
            "██║  ██║███████║   ██║   ██║  ██║╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
            "╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
          }, "\n"),
        },
      },
    },
  },

  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },
  --
  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  -- enhancement
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "rmagatti/goto-preview",
    dependencies = { "rmagatti/logger.nvim" },
    event = "BufEnter",
    config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
  },
  {
    "tiagovla/scope.nvim",
    config = function() require("scope").setup() end,
  },
  {
    "mg979/vim-visual-multi"
  },

  -- GIT
  {
    "sindrets/diffview.nvim",
    after = "plenary.nvim",
    requires = "nvim-lua/plenary.nvim",
  },
  {
    "tpope/vim-fugitive"
  },
  {
    "f-person/git-blame.nvim"
  },
  {
    'akinsho/git-conflict.nvim',
    version = "*",
    config = function() require("git-conflict").setup() end
  },

  -- Markdown
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  -- colorschema
  {
    "nyoom-engineering/oxocarbon.nvim"
  },
  {
      "qvalentin/helm-ls.nvim",
      ft = "helm",
      opts = {
          -- leave empty or see below
      },
  },
}
