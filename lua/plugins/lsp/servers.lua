local M = {}

M.servers = {
  -- LSPs
  gopls = {
    -- analyses = {
    --   unusedparams = true,
    -- },
    completeUnimported = true,
    gofumpt = true,
    staticcheck = true,
    usePlaceholders = true,
  },
  rust_analyzer = {
    cargo = {
      allFeatures = true,
      loadOutDirsFromCheck = true,
      runBuildScripts = true,
    },
    -- Add clippy lints for Rust.
    checkOnSave = {
      allFeatures = true,
      command = "clippy",
      extraArgs = { "--no-deps" },
    },
    files = {
      watcher = "server",
    },
    procMacro = {
      enable = true,
      ignored = {
        ["async-trait"] = { "async_trait" },
        ["napi-derive"] = { "napi" },
        ["async-recursion"] = { "async_recursion" },
      },
    },

  },
  solang = {},
  tsserver = {},
  docker_compose_language_service = {},
  helm_ls = {},
  jsonls = {},
  yamlls = {},
  taplo = {},
  marksman = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

return M
