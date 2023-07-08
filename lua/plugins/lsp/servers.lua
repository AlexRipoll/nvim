local M = {}

M.servers = {
  -- clangd = {},
  gopls = {},
  -- pyright = {},
  rust_analyzer = {},
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
