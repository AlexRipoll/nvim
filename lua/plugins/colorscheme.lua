return {
  {
    "savq/melange-nvim",
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme 'melange'
    -- end,
  },

  {
    -- bluish color scheme
    "cocopon/iceberg.vim",
    priority = 1000,
  },

  {
    "romainl/Apprentice",
    priority = 1000,
  },

  {
    "rose-pine/neovim",
    priority = 1000,
    -- config = function()
    --   require('rose-pine').setup({
    --     disable_background = true,
    --     disable_float_background = true,
    --   })
    -- end
  },

  {
    "Mofiqul/dracula.nvim",
    priority = 1000,
  },

  {
    -- Theme inspired by Atom
    "navarasu/onedark.nvim",
    priority = 1000,
  },

  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
        },
      })
    end,
  },

  {
    "morhetz/gruvbox",
    priority = 1000,
  },

  {
    "sainnhe/gruvbox-material",
    priority = 1000,
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    -- lazy = true,
    name = "catppuccin",
    priority = 1000,
    opts = {
      integrations = {
        alpha = true,
        barbar = true,
        cmp = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        neotree = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    },
  },

  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
  },

  {
    "marko-cerovac/material.nvim",
    priority = 1000,
    opts = {

      contrast = {
        terminal = true,             -- Enable contrast for the built-in terminal
        sidebars = true,             -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = true,     -- Enable contrast for floating windows
        cursor_line = false,         -- Enable darker background for the cursor line
        non_current_windows = false, -- Enable darker background for non-current windows
        filetypes = {},              -- Specify which filetypes get the contrasted (darker) background
      },

      styles = { -- Give comments style such as bold, italic, underline etc.
        comments = { --[[ italic = true ]]
        },
        strings = { --[[ bold = true ]]
        },
        keywords = { --[[ underline = true ]]
        },
        functions = { --[[ bold = true, undercurl = true ]]
        },
        variables = {},
        operators = {},
        types = {},
      },

      plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        -- "dap",
        -- "dashboard",
        "gitsigns",
        -- "hop",
        "indent-blankline",
        "lspsaga",
        -- "mini",
        -- "neogit",
        "nvim-cmp",
        -- "nvim-navic",
        -- "nvim-tree",
        "nvim-web-devicons",
        -- "sneak",
        "telescope",
        -- "trouble",
        "which-key",
      },

      disable = {
        colored_cursor = false, -- Disable the colored cursor
        borders = false,        -- Disable borders between verticaly split windows
        background = false,     -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
        term_colors = false,    -- Prevent the theme from setting terminal colors
        eob_lines = true,       -- Hide the end-of-buffer lines
      },

      high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = false,  -- Enable higher contrast text for darker style
      },

      lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

      async_loading = true,      -- Load parts of the theme asyncronously for faster startup (turned on by default)

      custom_colors = function(colors)
        -- colors.editor.bg = "#SOME_COLOR"
        colors.main.green = "#CDFF84"

        colors.syntax.variable = colors.main.white
        colors.syntax.field = colors.main.white
        colors.syntax.keyword = colors.main.white
        colors.syntax.value = colors.main.white
        colors.syntax.operator = colors.main.darkcyan
        colors.syntax.fn = colors.main.blue
        colors.syntax.string = colors.main.green
        colors.syntax.type = colors.main.yellow
      end,

      custom_highlights = {}, -- Overwrite highlights with your own
    },
  },

  {
    "folke/tokyonight.nvim",
    priority = 1000,
  },
}
