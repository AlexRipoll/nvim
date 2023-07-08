local M = {}

local keymaps = {
  { '<leader>rn', vim.lsp.buf.rename,                                                      '[R]e[n]ame' },
  { '<leader>ca', vim.lsp.buf.code_action,                                                 '[C]ode [A]ction' },
  { 'gd',         vim.lsp.buf.definition,                                                  '[G]oto [D]efinition' },
  { 'gr',         require('telescope.builtin').lsp_references,                             '[G]oto [R]eferences' },
  { 'gI',         vim.lsp.buf.implementation,                                              '[G]oto [I]mplementation' },
  { '<leader>D',  vim.lsp.buf.type_definition,                                             'Type [D]efinition' },
  { '<leader>ds', require('telescope.builtin').lsp_document_symbols,                       '[D]ocument [S]ymbols' },
  { '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,              '[W]orkspace [S]ymbols' },
  { 'K',          vim.lsp.buf.hover,                                                       'Hover Documentation' },
  { '<C-k>',      vim.lsp.buf.signature_help,                                              'Signature Documentation' },
  { 'gD',         vim.lsp.buf.declaration,                                                 '[G]oto [D]eclaration' },
  { '<leader>wa', vim.lsp.buf.add_workspace_folder,                                        '[W]orkspace [A]dd Folder' },
  { '<leader>wr', vim.lsp.buf.remove_workspace_folder,                                     '[W]orkspace [R]emove Folder' },
  { '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, '[W]orkspace [L]ist Folders' },
}

function M.on_attach(_, bufnr)
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
end

return M
