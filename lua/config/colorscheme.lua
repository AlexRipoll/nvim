local M = {}

function M.set_colorscheme(name)
  local status_ok, _ = pcall(vim.cmd.colorscheme, name)
  if not status_ok then
    return
  end
end

return M
