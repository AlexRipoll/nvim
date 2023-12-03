--
-- Show pending keybinds.
--
return {
  'folke/which-key.nvim',
  opts = {},
  config = function()
    local wk = require("which-key")
    wk.register({
      ["<leader>b"] = { name = "+buffer" },
      ["<leader>f"] = { name = "+find" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>h"] = { name = "+harpoon" },
      ["<leader>t"] = { name = "+terminal" },
      ["<leader>w"] = { name = "+workspace" },
    })
  end

}
