local M = {}

local keymaps = {
  { '<leader>rn', vim.lsp.buf.rename,                                                      'Rename' },
  { '<leader>ca', vim.lsp.buf.code_action,                                                 'Code action' },
  { 'gd',         vim.lsp.buf.definition,                                                  'Goto definition' },
  { 'gD',         vim.lsp.buf.declaration,                                                 'Goto declaration' },
  { 'gI',         require('telescope.builtin').lsp_implementations,                        'Goto implementation' },
  { 'gr',         require('telescope.builtin').lsp_references,                             'Goto references' },
  { 'gt',         require('telescope.builtin').lsp_type_definitions,                       'Goto type definition' },
  { '<leader>ds', require('telescope.builtin').lsp_document_symbols,                       'Document symbols' },
  { '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,              'Workspace symbols' },
  { 'K',          vim.lsp.buf.hover,                                                       'Hover documentation' },
  { '<C-k>',      vim.lsp.buf.signature_help,                                              'Signature documentation' },
  { '<leader>wa', vim.lsp.buf.add_workspace_folder,                                        'Workspace add folder' },
  { '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'Workspace list folders' },
  { '<leader>wr', vim.lsp.buf.remove_workspace_folder,                                     'Workspace remove folder' },
}

local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

function M.on_attach(client, bufnr)
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- Iterate over keymaps and set the mappings
  for _, keymap in ipairs(keymaps) do
    local keys, func, desc = unpack(keymap)
    nmap(keys, func, desc)
  end

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
  documentation = {
    border = border,
  }
  require("illuminate").on_attach(client)
end

return M
