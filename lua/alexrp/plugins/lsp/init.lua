local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "alexrp.plugins.lsp.mason"
require("alexrp.plugins.lsp.handlers").setup()
require "alexrp.plugins.lsp.null-ls"
