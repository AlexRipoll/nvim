return {
  {
    'savq/melange-nvim',
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme 'melange'
    -- end,
  },

  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme 'auto'
    -- end,
  },

  {
    'morhetz/gruvbox',
    priority = 1000,
  },

  {
    'sainnhe/gruvbox-material',
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
    'rebelot/kanagawa.nvim',
    priority = 1000,
  },

  {
    'marko-cerovac/material.nvim',
    priority = 1000,
    opts = {

      contrast = {
        terminal = false,            -- Enable contrast for the built-in terminal
        sidebars = false,            -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = false,    -- Enable contrast for floating windows
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
        "nvim-tree",
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

      async_loading = true,    -- Load parts of the theme asyncronously for faster startup (turned on by default)

      custom_colors = nil,     -- If you want to override the default colors, set this to a function

      custom_highlights = {},  -- Overwrite highlights with your own

    }
  },

  {
    'folke/tokyonight.nvim',
    priority = 1000,
  },

}
