-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {

  --
  -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  commit = vim.fn.has("nvim-0.9.0") == 0 and "057ee0f8783" or nil,
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  -- branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-k>"] = function(...)
              return actions.move_selection_previous(...) -- move to prev result
            end,
            ["<C-j>"] = function(...)
              return actions.move_selection_next(...) -- move to next result
            end,
            ["<C-f>"] = function(...)
              return actions.preview_scrolling_down(...) -- scroll down file preview
            end,
            ["<C-b>"] = function(...)
              return actions.preview_scrolling_up(...) -- scroll up file preview
            end,
          },
        },
      },
    })

    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
  end,
}
