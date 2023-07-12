require 'config.options'

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup("plugins")

require 'config.keymaps'
require 'config.autocmds'

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')


vim.g.material_style = "darker"
vim.cmd 'colorscheme material'
-- vim.g.material_style = "deep-ocean"
-- -- The line beneath this is called `modeline`. See `:help modeline`
-- -- vim: ts=2 sts=2 sw=2 et
