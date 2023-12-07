--
-- Statusline
--
return {
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    -- Color table for highlights
    -- stylua: ignore
    local colors = {
      yellow    = '#ECBE7B',
      green     = '#98be65',
      orange    = '#ff9e64',
      violet    = '#a9a1e1',
      blue      = '#83a598',
      red       = '#fb4934',
      white     = '#ebdbb2',
      gray      = '#a89984',
      lightgray = '#504945',
      darkgray  = '#333333',
      black     = '#262626',
    }

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = {
          normal = {
            a = { bg = colors.orange, fg = colors.black, gui = 'bold' },
            b = { bg = colors.darkgray, fg = colors.orange },
            c = { bg = colors.darkgray, fg = colors.gray },
            y = { bg = colors.lightgray, fg = colors.white },
            z = { bg = colors.lightgray, fg = colors.white }
          },
          insert = {
            a = { bg = colors.gray, fg = colors.black, gui = 'bold' },
            b = { bg = colors.darkgray, fg = colors.orange },
            c = { bg = colors.darkgray, fg = colors.gray },
            y = { bg = colors.lightgray, fg = colors.white },
            z = { bg = colors.lightgray, fg = colors.white }
          },
          visual = {
            a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
            b = { bg = colors.darkgray, fg = colors.orange },
            c = { bg = colors.darkgray, fg = colors.gray },
            y = { bg = colors.lightgray, fg = colors.white },
            z = { bg = colors.lightgray, fg = colors.white }
          },
          replace = {
            a = { bg = colors.red, fg = colors.black, gui = 'bold' },
            b = { bg = colors.darkgray, fg = colors.orange },
            c = { bg = colors.darkgray, fg = colors.gray },
            y = { bg = colors.lightgray, fg = colors.white },
            z = { bg = colors.lightgray, fg = colors.white }
          },
          command = {
            a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
            b = { bg = colors.darkgray, fg = colors.orange },
            c = { bg = colors.darkgray, fg = colors.gray },
            y = { bg = colors.lightgray, fg = colors.white },
            z = { bg = colors.lightgray, fg = colors.white }
          },
          inactive = {
            a = { bg = colors.gray, fg = colors.black, gui = 'bold' },
            b = { bg = colors.darkgray, fg = colors.orange },
            c = { bg = colors.darkgray, fg = colors.gray },
            y = { bg = colors.lightgray, fg = colors.white },
            z = { bg = colors.lightgray, fg = colors.white }
          }
        },
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff' },
        lualine_c = { { 'filename', path = 4 } },
        lualine_x = {
          { 'diagnostics', symbols = { error = '✖', warn = '' } },
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = colors.orange },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    })
  end,
}
