return {

  {
    'tpope/vim-fugitive'
  },

  {
    'tpope/vim-rhubarb'
  },

  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        untracked    = { hl = 'GitSignsAdd', text = '┆', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gb', require('gitsigns').blame_line,
          { buffer = bufnr, desc = 'Git blame line' })
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
          { buffer = bufnr, desc = 'Git go to previous hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk,
          { buffer = bufnr, desc = 'Git go to next hunk' })
        vim.keymap.set('n', '<leader>gp', require('gitsigns').preview_hunk,
          { buffer = bufnr, desc = 'Git preview hunk' })
        vim.keymap.set('n', '<leader>gr', require('gitsigns').reset_hunk,
          { buffer = bufnr, desc = 'Git reset hunk' })
        vim.keymap.set('n', '<leader>gR', require('gitsigns').reset_buffer,
          { buffer = bufnr, desc = 'Git reset buffer' })
      end,
    },
  },

  {
    'sindrets/diffview.nvim'
  },
}
