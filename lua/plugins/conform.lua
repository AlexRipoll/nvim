--
-- Code formatter
--
return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        go = { "goimports-reviser", "golines", "gofumpt" }, -- Conform will run multiple formatters sequentially
        graphql = { "prettier" },
        javascript = { "prettier" },
        json = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier" },
        rust = { "rustfmt" },
        typescript = { "prettier" },
        yaml = { "prettier" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })
  end,
}
