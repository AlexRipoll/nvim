return {
  -- Useful plugin to show you pending keybinds.
  {
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
  },

  -- Persist session
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    }
  },

  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow",
    opts = {
      border = "rounded",
      style = "dark",
      width = 150,
      height = 180,
      width_ratio = 0.7,
      height_ratio = 0.9,
    },
  },

}
