return {
  {
    'savq/melange-nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'melange'
    end,
  },

  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme 'auto'
    -- end,
  },
}
