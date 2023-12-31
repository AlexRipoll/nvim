-- Plugin that helps managing crates.io dependencies.
return {
  'saecki/crates.nvim',
  tag = 'stable',
  ft = { "rust", "toml" },
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('crates').setup()
  end,
}
